<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Click;
use App\Models\LinkHistory;

class Tracking extends Controller
{
    public function index(string $code) {
        $linkHistory = LinkHistory::where('code', $code)->first();
        if (!$linkHistory) {
            return response()->json(['status' => '404', 'message' => 'Not Found!'], 404, []);
        }
        $newClick = new Click();
        $newClick->code = sha1(time());
        $newClick->agent = \Request::userAgent();
        $newClick->ip = \Request::ip();
        $newClick->link_history_id = $linkHistory->id;

        try {
            $newClick->save();

            self::redirectTracking($newClick);
        } catch (\Exception $e) {
            \Log::error($e->getMessage());

            return response()->json(['status' => '500', 'error', $e->getMessage()], 200, []);
        }
    }

    public function redirectTracking($click) {
        $id = $click->linkHistory->campaign->code;
        $url = null;
        switch ($id) {
            case 'b0d252949e6eb6887b96d2edf3c1c245bb7a8f66':
                // Trip.com - CPS
                $rootUrl = $click->linkHistory->original_url;
                $sep = stripos($rootUrl, "?") !== false ? "&" : "?";
                $clickCode = $click->code;
                $url = $rootUrl.$sep."Allianceid=5997657&SID=168084274&trip_sub1=".$clickCode."&trip_sub3=D1438110";
                break;

            case '661d8178a32585301900931955599b9de5fa0e4d':
                // Banggood (Global)
                $url = self::involveTracking($click, 'clmli4x');
                break;

            case '64a0100d4e79553872503e04c2ff52d364b0e7eb':
                // Alibaba Ready To Ship - CPS
                $url = self::involveTracking($click, 'clmlj55');
                break;

            case '2a9301c50281b98262a381ee31e8f4ec7b436c35':
                // Alibaba CPS
                $url = self::involveTracking($click, 'clmlj38');
                break;

            case 'ec8cab9e144db62ac3f9a8da4c972686ffd71da8':
                // TikTok Shop VN - CPS
                $url = self::involveTracking($click, 'clmll6k');
                break;
            
            default:
                # code...
                break;
        }

        return redirect()->to($url)->send();
    }

    public function involveTracking($click, $id) {
        $rootUrl = $click->linkHistory->original_url;
        $clickCode = $click->code;
        $url = "https://invl.me/$id?aff_sub=".$clickCode."&url=".urlencode($rootUrl);
        return $url;
    }
}
