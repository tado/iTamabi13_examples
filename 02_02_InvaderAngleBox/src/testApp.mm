#include "testApp.h"


//--------------------------------------------------------------
void testApp::setup(){
    ofBackground(0);
    ofSetFrameRate(60);
    
    // ARTSAT WebAPIにアクセスしてJSONデータを取得
    bool result = response.open("http://api.artsat.jp/web/v2/invader/sensor_data.json");
    
    // 取得結果をコンソールに出力
    if (!result) {
        // もし取得できなかったら、エラーを出力
        cout << "faild to get JSON data!" << endl;
    } else {
        // 取得に成功したら、JSONデータを出力
        cout << response.getRawString() << endl;
    
        // 角速度を取得
        angleSpeed.x = response["results"][0]["sensors"]["ax"]["value"].asFloat();
        angleSpeed.y = response["results"][0]["sensors"]["ay"]["value"].asFloat();
        angleSpeed.z = response["results"][0]["sensors"]["az"]["value"].asFloat();
    }
    
    // 3D表示設定
    ofEnableDepthTest();
    ofEnableLighting();
    light.setPosition(200, 300, 50);
    light.enable();
}

//--------------------------------------------------------------
void testApp::update(){

}

//--------------------------------------------------------------
void testApp::draw(){
    ofVec3f angle = angleSpeed * ofGetElapsedTimef();
    
    // カメラ開始
    cam.begin();

    // 回転
    ofPushMatrix();
    ofRotateX(ofRadToDeg(angle.x));
    ofRotateY(ofRadToDeg(angle.y));
    ofRotateZ(ofRadToDeg(angle.z));
    
    // 立方体を描く
    ofBoxPrimitive box;
    box.draw();
    ofPopMatrix();

    // カメラ終了
    cam.end();
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

