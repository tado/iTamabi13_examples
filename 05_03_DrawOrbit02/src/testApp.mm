#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    // 画面設定
    ofBackground(0);
    ofSetFrameRate(30);
    
    // INVADERのセットアップ
    if (invader.setNotifier(this) == SATERROR_OK) {
        if (invader.setup() == SATERROR_OK) {
            cout << "Hello ARTSAT." << endl;
        }
    }
    
    // カメラ設定
    camera.setFov(45);
    camera.setFarClip(100000);
    camera.setDistance(30000);
    
    // 時間設定
    epoch = ofxSATTime::currentTime();
    current = epoch;
    
    // 衛星の大きさ設定
    box.set(500);
    
    // 地球のテクスチャーよみこみ
    ofDisableArbTex();
    earthTexture.loadImage("earth.jpg");
}


//--------------------------------------------------------------
void testApp::update(){
    current =  epoch + ofxSATTimeDiff(ofGetElapsedTimef() * TIME_SCALE);
    sgp.update(&current);
    
    // 衛星の座標をクオータニオンで計算
    ofQuaternion latRot;
    ofQuaternion lonRot;
    ofVec3f position;
    
    float latitude = -sgp.getSatLatitude();
    float longitude = sgp.getSatLongitude();
    float altitude = sgp.getSatAlt() + EARTH_SIZE;
    
    position.set(0, 0, altitude);
    latRot.makeRotate(latitude, 1, 0, 0);
    lonRot.makeRotate(longitude, 0, 1, 0);
    position = latRot * lonRot * position;
    box.setPosition(position);
}

//--------------------------------------------------------------
void testApp::draw(){
    camera.begin();
    
    // Zバッファー
    ofEnableDepthTest();
    
    // 地球を描画
    ofSetColor(255);
    earthTexture.getTextureReference().bind();
    earth.setRadius(EARTH_SIZE);
    earth.draw();
    earthTexture.getTextureReference().unbind();
    
    // 衛星を描画
    box.draw();
    
    ofDisableDepthTest();
    camera.end();
}

void testApp::onNotifyTLE(ofxSAT::TLERec const& tle, ofxSATTime const& time){
    // 取得したTLEをファイルに保存
    string name;
    string path;
    ofstream file;

    name = invader.getID();
    ofStringReplace(name, "://", "");
    path = ofToDataPath("");
    path = ofFilePath::join(ofFilePath::getEnclosingDirectory(path), "Library");
    path = ofFilePath::join(path, name + ".txt");

    file.open(path.c_str());
    if (file.is_open()) {
        file << name << endl;
        file << tle.line[0] << endl;
        file << tle.line[1] << endl;
        file.close();
        
        // SGPをセットアップ
        sgp.setup(path.c_str());
    }
    return;
}

void testApp::onNotifyData(ofxSATTime const& time){

}

//--------------------------------------------------------------
void testApp::exit(){
    invader.cleanup();
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

