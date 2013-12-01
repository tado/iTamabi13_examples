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
}

//--------------------------------------------------------------
void testApp::update(){
    // 現在の時刻を取得
    current = ofxSATTime::currentTime();
    // SGPに時間を設定
    sgp.update(&current);
    // 現在のPRISM衛星の3D座標を算出
    position = sgp.getPos();
}

//--------------------------------------------------------------
void testApp::draw(){
    // 現在の衛星の座標を表示
    ofSetHexColor(0xffffff);
    string curretTimeStr = current.format("%YYYY/%MM/%DD %hh:%mm:%ss");
    ofDrawBitmapString(curretTimeStr, 10, 15);
    ofDrawBitmapString("x = " + ofToString(position.x, 4) + "\n"
                       + "y = " + ofToString(position.y, 4) + "\n"
                       + "z = " + ofToString(position.z, 4), 10, 50);
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

