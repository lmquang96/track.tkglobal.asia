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
        $rootUrl = $click->linkHistory->original_url;
        $url = null;
        if ($setupRediect) {
            if ($setupRediect['platform'] == 'involve') {
                $url = self::involveTracking($click, $setupRediect['platform_id']);
            }
            if ($setupRediect['platform'] == 'goodaff') {
                $url = self::goodaffTracking($click, $setupRediect['platform_id']);
            }
            if ($setupRediect['platform'] == 'travelpayouts') {
                $url = self::travelpayoutsTracking($click, $setupRediect['platform_id'], $rootUrl);
            }
        } else {
            dd($id);
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

                case '557ed886394502e839b57b068422b64026ec11fd':
                    // Viator - CPS
                    $rootUrl = $click->linkHistory->original_url;
                    $sep = stripos($rootUrl, "?") !== false ? "&" : "?";
                    $clickCode = $click->code;
                    $url = $rootUrl.$sep."pid=P00277730&mcid=42383&medium=link&campaign=".$clickCode;
                    break;

                case 'a7a1e00c8a2bfb802d24345f285605bff60701cc':
                    // GetYourGuide - CPS
                    $rootUrl = $click->linkHistory->original_url;
                    $sep = stripos($rootUrl, "?") !== false ? "&" : "?";
                    $clickCode = $click->code;
                    $url = $rootUrl.$sep."partner_id=UX9ASYC&utm_medium=online_publisher&cmp=".$clickCode;
                    break;

                case 'c89d690a6702eff441bf859bf032c7e3708e2acc':
                    // StubHub CPA
                    $rootUrl = $click->linkHistory->original_url;
                    $clickCode = $click->code;
                    $url = "https://stubhub.prf.hn/click/camref:1110lduwf/pubref:$clickCode/ar:$clickCode/[p_id:1011l599298]/destination:$rootUrl";
                    break;

                case 'e3f8c3aae144a3350476d0360242fa3354f95425':
                    // Viagogo CPA
                    $rootUrl = $click->linkHistory->original_url;
                    $clickCode = $click->code;
                    $url = "https://viagogo.prf.hn/click/camref:1100l5pHoN/pubref:$clickCode/ar:$clickCode/[p_id:1011l599298]/destination:$rootUrl";
                    break;

                case 'd1d08b6472e8e842da767b0ab6da9ac32f2e3529':
                    $rootUrl = $click->linkHistory->original_url;
                    $clickCode = $click->code;
                    $sep = stripos($rootUrl, "?") !== false ? "&" : "?";
                    $url = $rootUrl.$sep."pcs=1&cid=1953935&tag=$clickCode";
                    break;

                case 'be4b3d00e3339b7ff5ca9a503b1578cee2f5607a':
                    // Sunworld
                    $rootUrl = $click->linkHistory->original_url;
                    $clickCode = $click->code;
                    // $sep = stripos($rootUrl, "?") !== false ? "&" : "?";
                    // $url = $rootUrl.$sep."pcs=1&cid=1953935&tag=$clickCode";
                    $campaginId = $target = "";

                    switch ($rootUrl) {
                        // [Sun World Fansipan Legend - Vẻ đẹp đỉnh cao của Bắc bộ]
                        case 'https://booking.sunworld.vn/vi/catalog?land=SunParadiseLandSaPa&park=FSS':
                            $campaginId = 'CON000000889';
                            $target = 'https://booking.sunworld.vn/';
                            break;

                        // [Sun World Ba Den Mountain - Nóc nhà Nam bộ]
                        case 'https://booking.sunworld.vn/vi/catalog?land=SunParadiseLandTayNinh&park=SBD':
                            $campaginId = 'CON000000888';
                            $target = 'https://booking.sunworld.vn';
                            break;

                        // [Sun World Hòn Thơm - Thiên đường giải trí tại Phú Quốc]
                        case 'https://booking.sunworld.vn/vi/catalog?land=SunParadiseLandPhuQuoc&park=HTI':
                            $campaginId = 'CON000000890';
                            $target = 'https://booking.sunworld.vn/';
                            break;

                        // [Lễ hội pháo hoa quốc tế Đà Nẵng 2026]
                        case 'https://booking.sunworld.vn/en/catalog?land=SunParadiseLandDaNang&park=DIF':
                            $campaginId = 'CON000000887';
                            $target = 'https://booking.sunworld.vn/en/catalog?land=SunParadiseLandDaNang&park=DIF&date=2025-12-01&flexibleDate=1&adultQuantity=1&childQuantity=0&seniorQuantity=0';
                            break;

                        // [Sun World Ba Na Hills: Đường lên tiên cảnh]
                        case 'https://booking.sunworld.vn/vi/catalog?land=SunParadiseLandDaNang&park=BNC':
                            $campaginId = 'CON000000892';
                            $target = 'https://booking.sunworld.vn/vi/catalog';
                            break;

                        // [Sunworld Vũng Tàu - Aqua Adventure]
                        case 'https://booking.sunworld.vn/vi/catalog?land=SunParadiseLandVungTau&park=SWV':
                            $campaginId = 'CON000000886';
                            $target = 'https://booking.sunworld.vn/vi';
                            break;

                        default:
                            break;
                        }
                    break;

                    $url = "https://c.trackig.site/c/v3/$campaginId/?source=deeplink_generator&network_id=85&sub=$clickIdEndcode&url=" . urlencode($target);

                    dd($url);

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

    public function travelpayoutsTracking($click, $id, $rootUrl) {
        $clickCode = $click->code;
        $targetUrl = urlencode($rootUrl);
        $url = "https://tp.media/r?marker=637824.$clickCode&trs=429275&p=8645&u=$targetUrl&campaign_id=$id";
        return $url;
    }
}
