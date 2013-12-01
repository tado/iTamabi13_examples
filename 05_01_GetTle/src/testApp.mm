#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    
    // ARTSATを初期化
    if (_invader.setNotifier(this) == SATERROR_OK) {
        if (_invader.setup() == SATERROR_OK) {
            cout << "Hello ARTSAT." << endl;
        }
    }
}

//--------------------------------------------------------------
void testApp::update(){
    
}

//--------------------------------------------------------------
void testApp::draw(){
    ofBackground(0);
    ofSetColor(255);
    
    //TLEを画面に表示
    ofDrawBitmapString(tleString, 20, 20);
}

void testApp::onNotifyTLE(ofxSAT::TLERec const& tle, ofxSATTime const& time){
    //取得したTLEをstring(文字列)に格納
    tleString = string(tle.line[0]) + "\n" + string(tle.line[1]);
}

void testApp::onNotifyData(ofxSATTime const& time){

}

//--------------------------------------------------------------
void testApp::exit(){
    _invader.cleanup();
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

