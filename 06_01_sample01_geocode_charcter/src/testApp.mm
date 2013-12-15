#include "testApp.h"

string country_code[249] = {"AD", "AE", "AF", "AG", "AI", "AL", "AM", "AO", "AQ", "AR", "AS", "AT", "AU", "AW", "AX", "AZ", "BA", "BB", "BD", "BE", "BF", "BG", "BH", "BI","BJ", "BL", "BM", "BN", "BO", "BQ", "BR", "BS", "BT", "BV", "BW", "BY", "BZ", "CA", "CC", "CD", "CF", "CG", "CH", "CI", "CK", "CL", "CM", "CN", "CO", "CR", "CU", "CV", "CW", "CX", "CY", "CZ", "DE", "DJ", "DK", "DM", "DO", "DZ", "EC", "EE", "EG", "EH", "ER", "ES", "ET", "FI", "FJ", "FK", "FM", "FO", "FR", "GA", "GB", "GD", "GE", "GF", "GG", "GH", "GI", "GL", "GM", "GN", "GP", "GQ", "GR", "GS", "GT", "GU", "GW", "GY", "HK", "HM", "HN", "HR", "HT", "HU", "ID", "IE", "IL", "IM", "IN", "IO", "IQ", "IR", "IS", "IT", "JE", "JM", "JO", "JP", "KE", "KG", "KH", "KI", "KM", "KN", "KP", "KR", "KW", "KY", "KZ", "LA", "LB", "LC", "LI", "LK", "LR", "LS", "LT", "LU", "LV", "LY", "MA", "MC", "MD", "ME", "MF", "MG", "MH", "MK", "ML", "MM", "MN", "MO", "MP", "MQ", "MR", "MS", "MT", "MU", "MV", "MW", "MX", "MY", "MZ", "NA", "NC", "NE", "NF", "NG", "NI", "NL", "NO", "NP", "NR", "NU", "NZ", "OM", "PA", "PE", "PF", "PG", "PH", "PK", "PL", "PM", "PN", "PR", "PS", "PT", "PW", "PY", "QA", "RE", "RO", "RS", "RU", "RW", "SA", "SB", "SC", "SD", "SE", "SG", "SH", "SI", "SJ", "SK", "SL", "SM", "SN", "SO", "SR", "SS", "ST", "SV", "SX", "SY", "SZ", "TC", "TD", "TF", "TG", "TH", "TJ", "TK", "TL", "TM", "TN", "TO", "TR", "TT", "TV", "TW", "TZ", "UA", "UG", "UM", "US", "UY", "UZ", "VA", "VC", "VE", "VG", "VI", "VN", "VU", "WF", "WS", "YE", "YT", "ZA", "ZM", "ZW"};
int country_num = 249;

//--------------------------------------------------------------
void testApp::setup(){
    ofBackground(224);
    ofSetFrameRate(30);
    country_index = 0;
    
    // ARTSAT WebAPIにアクセスしてJSONデータを取得
    bool result = artsatResponse.open("http://api.artsat.jp/web/v2/invader/sensor_data.json");
    
    // 取得結果をコンソールに出力
    if (!result) {
        // もし取得できなかったら、エラーを出力
        cout << "faild to get JSON data!" << endl;
    } else {
        // Artsat API取得に成功
        // 取得した緯度経度で、逆Geocode
        float lat = artsatResponse["results"][0]["sensors"]["lat"]["value"].asFloat();
        float lon = artsatResponse["results"][0]["sensors"]["lon"]["value"].asFloat();
        
        // テスト用の緯度経度(多摩美の場所)
        //lat = 35.6133349802915;
        //lon = 139.3518454802915;
        
        string url = "http://maps.googleapis.com/maps/api/geocode/json?latlng=" + ofToString(lat) + "," + ofToString(lon)+"&sensor=false";

        // GeocodingAPIにアクセスして結果を取得
        bool geoResult = geocodingResponse.open(url);
        if (!geoResult) {
            // もし取得できなかったら、エラーを出力
            cout << "faild to get Geocode data!" << endl;
        } else {
            cout << geocodingResponse.getRawString() << endl;
            
            //国名を抽出
            ofxJSONElement addrComponents = geocodingResponse["results"][0]["address_components"];
            country_long_name = geocodingResponse["results"][int(geocodingResponse["results"].size() - 1)]["formatted_address"].asString();
            country_short_name = geocodingResponse["results"][int(geocodingResponse["results"].size() - 1)]["address_components"][0]["short_name"].asString();
            
            //国番号を取得
            for (int i = 0; i < country_num; i++) {
                if (country_short_name == country_code[i]) {
                    country_index = i + 1;
                    break;
                }
            }
        }
    }
    
    //取得した国番号に応じて、背景画像とキャラクター画像を選択
    switch (country_index) {
        case 1:
            backImg.loadImage("background0.png");
            charaImg.loadImage("chara0.png");
            break;
        case 2:
            backImg.loadImage("background1.png");
            charaImg.loadImage("chara1.png");
            break;

            // ... 国をどんどん増やしていく
            
        default:
            backImg.loadImage("background_no.png");
            charaImg.loadImage("chara_no.png");
            break;
    }
}

//--------------------------------------------------------------
void testApp::update(){

}

//--------------------------------------------------------------
void testApp::draw(){
    ofSetColor(255);
    
    // 抽出した国番号で、ここで背景とキャラクターを表示
    
    backImg.draw(0, 0);
    charaImg.draw(70, 150);
}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}

