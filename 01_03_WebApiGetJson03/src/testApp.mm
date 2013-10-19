#include "testApp.h"


//--------------------------------------------------------------
void testApp::setup(){
    ofBackground(224);
    ofSetFrameRate(30);
    
    // ARTSAT WebAPIにアクセスしてJSONデータを取得
    bool result = response.open("http://api.artsat.jp/web/v2/invader/sensor_data.json");
    
    // 取得結果をコンソールに出力
    if (!result) {
        // もし取得できなかったら、エラーを出力
        cout << "faild to get JSON data!" << endl;
    } else {
        // 取得に成功したら、JSONデータを出力
        cout << response.getRawString() << endl;
    }
}

//--------------------------------------------------------------
void testApp::update(){

}

//--------------------------------------------------------------
void testApp::draw(){
    ofSetColor(63);
    int lineHeigt = 15;
    
    // JSONデータをパースして、画面に表示
    string available_time = response["results"][0]["closest_available_time_iso_string"].asString();
    ofDrawBitmapString(available_time, 10, lineHeigt*1);
    float lat = response["results"][0]["sensors"]["lat"]["value"].asFloat();
    ofDrawBitmapString("lat = " + ofToString(lat,12), 10, lineHeigt*2);
    float lon = response["results"][0]["sensors"]["lon"]["value"].asFloat();
    ofDrawBitmapString("lon = " + ofToString(lon,12), 10, lineHeigt*3);
    float alt = response["results"][0]["sensors"]["alt"]["value"].asFloat();
    ofDrawBitmapString("alt = " + ofToString(alt,12), 10, lineHeigt*4);
    float ax = response["results"][0]["sensors"]["ax"]["value"].asFloat();
    ofDrawBitmapString("ax = " + ofToString(ax,12), 10, lineHeigt*5);
    float ay = response["results"][0]["sensors"]["ay"]["value"].asFloat();
    ofDrawBitmapString("ay = " + ofToString(ay,12), 10, lineHeigt*6);
    float az = response["results"][0]["sensors"]["az"]["value"].asFloat();
    ofDrawBitmapString("az = " + ofToString(az,12), 10, lineHeigt*7);
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

