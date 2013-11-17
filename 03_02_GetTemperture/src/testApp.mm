#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    if (_invader.setNotifier(this) == SATERROR_OK) {
        if (_invader.setup() == SATERROR_OK) {
            cout << "Hello ARTSAT." << endl;
        }
    }
    return;
}

//--------------------------------------------------------------
void testApp::update(){
    
}

//--------------------------------------------------------------
void testApp::draw(){
    ofBackground(0);
    ofSetColor(255);
    double value;
    for (int i = 0; i < available.size(); ++i) {
        if (_invader.getSensorTemperatureSolarPX(available[i], &value) == SATERROR_OK) {
            ofDrawBitmapString("solar panel +X is " + ofToString(value,10), 10, 15 * (i+1));
        }
    }
}

void testApp::onNotifyTLE(ofxSAT::TLERec const& tle, ofxSATTime const& time){
    ofxSAT::Notifier::onNotifyTLE(tle, time);
    cout << "new TLE received." << endl;
    
    ofxSATTime begin;
    ofxSATTime end;
    
    end = ofxSATTime::currentTime();
    begin = ofxSATTime(end).subDay(1);
    
    if (_invader.getAvailableTime(begin, end, &available) == SATERROR_OK) {
        for (int i = 0; i < available.size(); ++i) {
            cout << available[i].getYear()
            << ":" << available[i].getMonth()
            << ":" << available[i].getDay()
            << ":" << available[i].getHour()
            << ":" << available[i].getMinute()
            << ":" << available[i].getSecond() << endl;
        }
    }
    return;
}
void testApp::onNotifyData(ofxSATTime const& time){
    ofxSAT::Notifier::onNotifyData(time);
    
    cout << "new telemetry data received." << endl;
    return;
}

//--------------------------------------------------------------
void testApp::exit(){
    _invader.cleanup();
    return;
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

