#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    ofBackground(224);
    ofSetFrameRate(30);
    
    // ARTSAT WebAPIにアクセスしてJSONデータを取得
    bool result = artsatResponse.open("http://api.artsat.jp/web/v2/invader/sensor_data.json");
    
    // 取得結果をコンソールに出力
    if (!result) {
        // もし取得できなかったら、エラーを出力
        cout << "faild to get JSON data!" << endl;
    } else {
        // Artsat API取得に成功
        cout << artsatResponse.getRawString() << endl;
        // 取得した緯度経度で、逆Geocode
        //float lat = artsatResponse["results"][0]["sensors"]["lat"]["value"].asFloat();
        //float lon = artsatResponse["results"][0]["sensors"]["lon"]["value"].asFloat();
        float lat = 35.6133349802915;
        float lon = 139.3518454802915;
        string url = "http://maps.googleapis.com/maps/api/geocode/json?latlng="
        + ofToString(lat) + "," + ofToString(lon)+"&sensor=false";
        bool geoResult = geocodingResponse.open(url);
        if (!geoResult) {
            // もし取得できなかったら、エラーを出力
            cout << "faild to get Geocode data!" << endl;
        } else {
            cout << url << endl;
        }
    }
}

//--------------------------------------------------------------
void testApp::update(){

}

//--------------------------------------------------------------
void testApp::draw(){
    ofSetColor(63);
    
    // JSONデータ解析して表示
    //取得した時間
    string available_time = artsatResponse["results"][0]["closest_available_time_iso_string"].asString();
    ofDrawBitmapString(available_time, 20, 20);

    //アドレスを表示
    string  formatted_address = geocodingResponse["results"][0]["formatted_address"].asString();
    ofDrawBitmapString("ARTSAT is flying here! : ", 20, 40);
    ofDrawBitmapString(formatted_address, 20, 60);
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

