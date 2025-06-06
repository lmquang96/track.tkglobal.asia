<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Click;
use App\Models\LinkHistory;
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

            case 'c84e892b5c53ed3b30fe62577da9dfd32a026a05':
                // Taobao (Non-deeplinkable) - CPS
                $url = self::involveTracking($click, 'clmll8o');
                break;

            case 'd469b2c828005b1f624aa9ffa3e8ca58b3481716':
                // Taobao (Deeplinkable) - CPS
                $url = self::involveTracking($click, 'clmll9c');
                break;

            case '8b0977cd08956f11ac9a4e0492d905416dbea119':
                // AliExpress (Global) - CPS
                $url = self::involveTracking($click, 'clmllcl');
                break;

            case '5dd2f46fde33382a520f2851da6224c913e6e50c':
                // Shopee VN - CPS
                $url = self::involveTracking($click, 'clmlldh');
                break;

            case '503e71247eab6772e7d9f231df2685c06e78e11f':
                // Klook Travel Private - CPS
                $url = self::involveTracking($click, 'clmllnr');
                break;

            case 'b85c4ff0747a42cf042fed36ddd3ff528e39002f':
                // Traveloka VN - CPS
                $url = self::involveTracking($click, 'clmllo4');
                break;

            case '182d84841b6fb917175f8c63a6a7b6ed61e6e2ed':
                // KKday Global Network - CPS
                $url = self::involveTracking($click, 'clmllpn');
                break;

            case '29ca27939fe3ede82de5c4e6777d5976e9bb2c04':
                // Trip.com Network - CPS
                $url = self::involveTracking($click, 'clmmyg5');
                break;

            case '450829e35b03db8f1413a8ef60cc94a0d43dc1a8':
                // Udemy APAC - CPS
                $url = self::involveTracking($click, 'clmpvs6');
                break;

            case '8beb356031b37381d91200607e9f4b0af00fca6e':
                // KKday Global - CPS
                $rootUrl = $click->linkHistory->original_url;
                $sep = stripos($rootUrl, "?") !== false ? "&" : "?";
                $clickCode = $click->code;
                $url = $rootUrl.$sep."cid=21967&ud1=".$clickCode;
                break;

            case '908ed702367d6f0e5b38b46c4f8dfdd1ad8f8af8':
                // Aoao - VN
                $url = self::goodaffTracking($click, 'aoao.vn');
                break;

            case 'bafa48e876fc7d738aaef945ec56c6ab3887b179':
                // Cayvang - VN
                $url = self::goodaffTracking($click, 'cayvang.vn');
                break;

            case '7d7cb179ab6630911ca4c9be95e8adb6e8a65869':
                // Credify - VN
                $url = self::goodaffTracking($click, 'credify.vn');
                break;

            case '8d3401f8325fcae7fc0d9bc005baf50ea0828b72':
                // Creditera - VN | android
                $url = self::goodaffTracking($click, 'creditera.app.vn');
                break;

            case '7b51648e4ab6cbae929a0d6ec8c7b10ed9e2c2ae':
                // Creditera - VN | ios
                $url = self::goodaffTracking($click, 'creditera.ios.vn');
                break;

            case 'cda1b0391b7fa8edc24be38aaf9429109fcaac76':
                // Credy - VN
                $url = self::goodaffTracking($click, 'credy.vn');
                break;

            case 'd2085bd9e7917fc856f6ea7d36b3f3a67bb8d483':
                // Crezu - VN
                $url = self::goodaffTracking($click, 'crezu.vn');
                break;

            case '9bc97825c84ad5ded93c247a3a2e6a8b34f3991e':
                // Mazilla - VN
                $url = self::goodaffTracking($click, 'mazilla.vn');
                break;

            case 'e93f7b109216603d005694173b1c52d6bb2d8171':
                // Moneycat - VN
                $url = self::goodaffTracking($click, 'moneycat.vn');
                break;

            case '4bbd20b417cee33d161bdba682079472baa1fcd4':
                // Moneyveo - VN
                $url = self::goodaffTracking($click, 'moneyveo.vn');
                break;

            case '7a271ca9199eeb6d54b0f4626102ecf65d7300df':
                // Soscredit - VN
                $url = self::goodaffTracking($click, 'soscredit.vn');
                break;

            case '6d291605e66d482d79b712895c8ba2807d190224':
                // Tieno - VN
                $url = self::goodaffTracking($click, 'tieno.vn');
                break;

            case 'f3afc15d782c93646f5afbe96b35733032c9cd31':
                // Vayvnd - VN
                $url = self::goodaffTracking($click, 'vayvnd.vn');
                break;

            case 'f52784e8af9eb23e2ca08ba9d1e8568fbd81fb95':
                // Zaimoo - VN
                $url = self::goodaffTracking($click, 'zaimoo.vn');
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

    public function goodaffTracking($click, $id) {
        $clickCode = $click->code;
        $url = "https://affilink.eu/$id/ni80lej1id?s1=$clickCode";
        return $url;
    }
}
