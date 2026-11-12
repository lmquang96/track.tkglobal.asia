<?php

namespace App\Services;

use Illuminate\Support\Facades\Auth;
use App\Models\LinkHistory;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Cache;
use Carbon\Carbon;

class TiktokService
{
  protected string $appKey;
  protected string $appSecret;
  protected string $refreshTokenEndpoint;
  protected string $searchProductPath;
  protected string $generateLinkPath;

  public function __construct()
  {
    $this->appKey = config('tracking.tiktok.app_key');
    $this->appSecret = config('tracking.tiktok.app_secret');
    $this->refreshTokenEndpoint = config('tracking.tiktok.refresh_token_endpoint');
    $this->searchProductPath = config('tracking.tiktok.search_product_path');
    $this->generateLinkPath = config('tracking.tiktok.generate_link_path');
  }

  public function createLinkTiktok(string $clickId, string $url)
  {
    return $this->getLinkTiktok($clickId, $url);
  }

  private function getLinkTiktok(string $clickId, string $url)
  {
    $cacheKey = md5($url);
    $link = Cache::remember($cacheKey, now()->addDay(), function () use ($clickId, $url) {
      $accessToken = $this->getAccessToken();
      $appKey      = $this->appKey;
      $appSecret   = $this->appSecret;
      $path        = $this->generateLinkPath;

      $timestamp = (string) time();

      $query = [
        'app_key' => $appKey,
        'timestamp' => $timestamp,
      ];

      $productId = $this->getProductCodeFromUrl($url);

      $body = json_encode([
        'material' => [
          'ids' => [
            $productId,
          ],
          'type' => 'PRODUCT',
        ],
      ], JSON_UNESCAPED_SLASHES);

      $result = $this->generateTikTokSign(
        $appSecret,
        $path,
        $query,
        $body
      );

      $sign = $result['sign'];

      $url = 'https://open-api.tiktokglobalshop.com'
        . $path
        . '?'
        . http_build_query([
          'app_key' => $appKey,
          'timestamp' => $timestamp,
          'sign' => $sign,
        ]);

      try {
        $response = Http::withHeaders([
          'Content-Type' => 'application/json',
          'x-tts-access-token' => $accessToken,
        ])->withBody(
          $body,
          'application/json'
        )->post($url);

        $response = $response->json();

        if ($response['code'] == 0) {
          $link = data_get($response, 'data.sharing_links.{first}.sharing_link');

          return $link;
        }
      } catch (\Throwable $th) {
        Log::error('Lỗi xảy ra khi tạo link tiktok: ' . $th->getMessage());
        return null;
      }
    });

    $link = str_replace(
      '%7B%22t%22%3A1%2C%22k%22%3A', '%7B%22event_id%22%3A%22'.$clickId.'%22%2C%22t%22%3A1%2C%22k%22%3A', $link);

      return $link;
  }

  function generateTikTokSign(
    string $appSecret,
    string $path,
    array $queryParams,
    string $body = ''
  ): array {
    unset($queryParams['sign'], $queryParams['access_token']);

    ksort($queryParams);

    $signString = $path;

    foreach ($queryParams as $key => $value) {
      $signString .= $key . (string) $value;
    }

    $signString .= $body;

    $signString = $appSecret . $signString . $appSecret;


    // 5. Generate the HMAC-SHA256 hash in lowercase hex
    $sign = hash_hmac(
      'sha256',
      $signString,
      $appSecret
    );

    return [
      'sign' => $sign,
      'sign_string' => $signString,
    ];
  }

  private function getProductCodeFromUrl(string $url) {
    $path = parse_url($url, PHP_URL_PATH);

    $segments = explode('/', trim($path, '/'));

    $productId = end($segments);

    if (strlen($productId) < 18 || !is_numeric($productId)) {
      $response = Http::get($url);

      $finalUrl = $response->effectiveUri();

      if ($finalUrl) {
        $path = $finalUrl->getPath();

        $segments = explode('/', trim($path, '/'));

        $productId = end($segments);
      }
    }

    if (strlen($productId) < 18 && !is_numeric($productId)) {
      $baseProductIdStore = Cache::remember("base_product_id_store", now()->addMinutes(1440), function() {
        return $this->getRandomProduct();
      });

      $productId = $baseProductIdStore[array_rand($baseProductIdStore)];
    }

    return $productId;
  }

  private function getRandomProduct() {
    $accessToken = $this->getAccessToken();
    $appKey    = $this->appKey;
    $appSecret = $this->appSecret;
    $path   = $this->searchProductPath;

    $timestamp = (string) time();

    $query = [
      'app_key' => $appKey,
      'timestamp' => $timestamp,
      'page_size' => 20,
      'sort_field' => 'units_sold',
      'sort_order' => 'DESC'
    ];

    $body = json_encode([], JSON_UNESCAPED_SLASHES);

    $result = $this->generateTikTokSign(
      $appSecret,
      $path,
      $query,
      $body
    );

    $sign = $result['sign'];

    $url = 'https://open-api.tiktokglobalshop.com'
      . $path
      . '?'
      . http_build_query([
        'app_key' => $appKey,
        'timestamp' => $timestamp,
        'sign' => $sign,
        'page_size' => 20,
        'sort_field' => 'units_sold',
        'sort_order' => 'DESC'
      ]);

    try {
      $response = Http::withHeaders([
        'Content-Type' => 'application/json',
        'x-tts-access-token' => $accessToken,
      ])->withBody(
        $body,
        'application/json'
      )->post($url);

      $response = $response->json();

      if ($response['code'] == 0) {
        $products = data_get($response, 'data.products', []);
        $baseProductIdStore = [];

        foreach ($products as $product) {
          $baseProductIdStore[] = $product['id'];
        }

        return $baseProductIdStore;
      }
    } catch (\Throwable $th) {
      Log::error('Lỗi xảy ra khi lấy sản phẩm tiktok: ' . $th->getMessage());
      return [];
    }
  }

  private function getAccessToken() {
    $endpoint = $this->refreshTokenEndpoint;
    $accessToken = Cache::get('tiktok_access_token');

    if (!$accessToken) {
      $refreshToken = Cache::get('tiktok_refresh_token');

      try {
        $response = Http::get($endpoint, [
          'app_key' => $this->appKey,
          'refresh_token' => $refreshToken,
          'grant_type' => 'refresh_token'
        ]);

        $response = $response->json();

        $accessToken = data_get($response, 'data.access_token');
        $accessTokenExpire = data_get($response, 'data.access_token_expire_in');
        $refreshToken = data_get($response, 'data.refresh_token');
        $refreshTokenExpire = data_get($response, 'data.refresh_token_expire_in');

        Cache::put('tiktok_refresh_token', $refreshToken, Carbon::createFromTimestamp((int) $refreshTokenExpire));

        Cache::put('tiktok_access_token', $accessToken, Carbon::createFromTimestamp((int) $accessTokenExpire));
      } catch (\Throwable $th) {
        Log::error('Lỗi xảy ra khi lấy access token tiktok: ' . $th->getMessage());
      }
    }

    return $accessToken;
  }
}