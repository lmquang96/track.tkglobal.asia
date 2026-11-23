<?php

namespace App\Services;

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Cache;
use Carbon\Carbon;
use App\Models\LinkHistory;

class LinkService
{
  public function storeHistory($oid, $userId, $url, $sub1, $sub2, $sub3, $sub4)
  {
    $linkHistory = new LinkHistory;

    $linkHistory->code = sha1(time());
    $linkHistory->original_url = $url;
    $linkHistory->domain = 'track.tkglobal.asia';
    $linkHistory->short_url = null;
    $linkHistory->sub1 = $sub1;
    $linkHistory->sub2 = $sub2;
    $linkHistory->sub3 = $sub3;
    $linkHistory->sub4 = $sub4;
    $linkHistory->user_id = $userId;
    $linkHistory->campaign_id = $oid;

    try {
      $linkHistory->save();

      return [
        'status' => true,
        'code' => $linkHistory->code,
        'id' => $linkHistory->id
      ];
    } catch (\Throwable $th) {
      Log::error('Lỗi xảy ra khi lưu lịch sử tạo link: ' . $th->getMessage());

      return [
        'status' => false,
        'data' => $th->getMessage()
      ];
    }
  }
}