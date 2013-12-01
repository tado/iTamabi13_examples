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

}

//--------------------------------------------------------------
void testApp::draw(){

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

