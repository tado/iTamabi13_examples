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
    
    // 軌道の描画モード設定
    orbit.setMode(OF_PRIMITIVE_LINE_STRIP);
}


//--------------------------------------------------------------
void testApp::update(){
    current =  epoch + ofxSATTimeDiff(ofGetElapsedTimef() * TIME_SCALE);
    sgp.update(&current);
    
    // 衛星の位置を設定
    box.setPosition(sgp.getPos());
    orbit.addVertex(sgp.getPos());
    orbit.addColor(ofFloatColor(1.0,1.0,0.0));
}

//--------------------------------------------------------------
void testApp::draw(){
    camera.begin();
    
    // Zバッファー
    ofEnableDepthTest();
    
    // 地球を描画
    ofSetColor(0, 0, 255);
    earth.setRadius(EARTH_SIZE);
    earth.drawWireframe();
    
    // 衛星を描画
    ofSetColor(255);
    box.draw();
    
    // 軌道を描画
    orbit.draw();
    
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

