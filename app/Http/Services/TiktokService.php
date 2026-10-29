<?php

namespace App\Services\Traffic;

use Illuminate\Support\Facades\Auth;
use App\Models\LinkHistory;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http;

class TiktokService
{
  public function createLinkTiktok(string $clickId)
  {
    return $this->getLinkTiktok($clickId);
  }

  private function getLinkTiktok($clickId)
  {
    $accessToken = 'ROW_Nv2O5QAAAACY3gRglKiHdmPBGimNqqR1Qh1Me5ptOk-q_BCHM7asj9jHvfv76J79aBurL0Na-GFHyu0zlA4yxmi9X6lkMgp4Zm-pfk4X3PUpP1ei62VKMA';

    $refreshToken = 'ROW_y3dljwAAAACMR4Z2gLlrZYIz86VFtx8GmXXerX0eP91ns4WjpRe87ZgRUGspKCRzEBCHF0PIyvTX-j9QBBPQ2IXBZvKqjRnS';

    $appKey    = '6locfdh94v0q2';
    $appSecret = '21e11117be3a4f566285388741ffd2e11c2dcaf3';
    $path   = '/affiliate_creator/202505/affiliate_sharing_links/general_publishers/generate_batch';


    $timestamp = (string) time();

    $query = [
      'app_key' => $appKey,
      'timestamp' => $timestamp,
    ];

    $body = json_encode([
      'material' => [
        'ids' => [
          '1729749693232744449',
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

        $link = str_replace(
          '%7B%22t%22%3A1%2C%22k%22%3A', '7B%22event_id%22%3A%22'.$clickId.'%22%2C%22t%22%3A1%2C%22k%22%3A', $link);

        return $link;
      }
    } catch (\Throwable $th) {
      Log::error('Lỗi xảy ra khi tạo link tiktok: ' . $th->getMessage());
      return null;
    }
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
}