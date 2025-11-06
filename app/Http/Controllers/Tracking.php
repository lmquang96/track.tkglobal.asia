<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Click;
use App\Models\LinkHistory;
use App\Models\SetupRedirect;
use Illuminate\Support\Facades\Log;


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
            Log::error($e->getMessage());

            return response()->json(['status' => '500', 'error', $e->getMessage()], 200, []);
        }
    }

    public function redirectTracking($click) {
        $id = $click->linkHistory->campaign->code;
        $setupRediect = SetupRedirect::where('campaign_code', $id)->first();
        $url = null;
        if ($setupRediect) {
            if ($setupRediect['platform'] == 'involve') {
                $url = self::involveTracking($click, $setupRediect['platform_id']);
            }
            if ($setupRediect['platform'] == 'goodaff') {
                $url = self::goodaffTracking($click, $setupRediect['platform_id']);
            }
        } else {
            switch ($id) {
                case 'b0d252949e6eb6887b96d2edf3c1c245bb7a8f66':
                    // Trip.com - CPS
                    $rootUrl = $click->linkHistory->original_url;
                    $sep = stripos($rootUrl, "?") !== false ? "&" : "?";
                    $clickCode = $click->code;
                    $url = $rootUrl.$sep."Allianceid=5997657&SID=168084274&trip_sub1=".$clickCode."&trip_sub3=D1438110";
                    break;

                case '0de4601976eba5cca506aef3456de07300c48b77':
                    // Trip.com - CPS (Private)
                    $rootUrl = $click->linkHistory->original_url;
                    $sep = stripos($rootUrl, "?") !== false ? "&" : "?";
                    $clickCode = $click->code;
                    $url = $rootUrl.$sep."Allianceid=6582080&SID=221208436&trip_sub1=".$clickCode."&trip_sub3=D4029601";
                    break;

                case 'd37b1170fc1c15c0bc2c7c380e56377c60e46c6f':
                    // Trip.com new (private)
                    $rootUrl = $click->linkHistory->original_url;
                    $sep = stripos($rootUrl, "?") !== false ? "&" : "?";
                    $clickCode = $click->code;
                    $url = $rootUrl.$sep."Allianceid=7032187&SID=256027199&trip_sub1=".$clickCode."&trip_sub3=D5203956";
                    break;

                case '8beb356031b37381d91200607e9f4b0af00fca6e':
                    // KKday Global - CPS
                    $rootUrl = $click->linkHistory->original_url;
                    $sep = stripos($rootUrl, "?") !== false ? "&" : "?";
                    $clickCode = $click->code;
                    $url = $rootUrl.$sep."cid=21967&ud1=".$clickCode;
                    break;

                default:
                    # code...
                    break;
            }
        }

        return redirect()->to($url)->send();
    }

    public function involveTracking($click, $id) {
        $rootUrl = $click->linkHistory->original_url;
        $clickCode = $click->code;
        $url = "https://invl.me/$id?aff_sub=".$clickCode."&url=".urlencode($rootUrl);
        return $url;
    }

    public function goodaffTracking($click, $id) {
        $clickCode = $click->code;
        $url = "https://affilink.eu/$id/ni80lej1id?s1=$clickCode";
        return $url;
    }
}
