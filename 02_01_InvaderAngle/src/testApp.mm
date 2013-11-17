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
        angleSpeed.x = response["results"][0]["sensors"]["ax"]["value"].asFloat();
        angleSpeed.y = response["results"][0]["sensors"]["ay"]["value"].asFloat();
        angleSpeed.z = response["results"][0]["sensors"]["az"]["value"].asFloat();
    }
}

//--------------------------------------------------------------
void testApp::update(){

}

//--------------------------------------------------------------
void testApp::draw(){
    // 取得した角速度を表示
    ofSetColor(31);
    ofDrawBitmapString("angle speed x = " + ofToString(angleSpeed.x, 8), 10, 15);
    ofDrawBitmapString("angle speed y = " + ofToString(angleSpeed.y, 8), 10, 30);
    ofDrawBitmapString("angle speed z = " + ofToString(angleSpeed.z, 8), 10, 45);
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

