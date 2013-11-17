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
    double value;
    float rectWidth = ofGetWidth()/6.0;
    float rectHeight = ofGetHeight()/float(available.size());
    for (int i = 0; i < available.size(); ++i) {
        if (_invader.getSensorTemperatureSolarPX(available[i], &value) == SATERROR_OK) {
            int bright = ofMap(value, -50, 50, 0, 255);
            ofSetColor(bright);
            ofRect(rectWidth * 0, i * rectHeight, rectWidth, rectHeight);
        }
        if (_invader.getSensorTemperatureSolarPY(available[i], &value) == SATERROR_OK) {
            int bright = ofMap(value, -50, 50, 0, 255);
            ofSetColor(bright);
            ofRect(rectWidth * 1, i * rectHeight, rectWidth, rectHeight);
        }
        if (_invader.getSensorTemperatureSolarPZ(available[i], &value) == SATERROR_OK) {
            int bright = ofMap(value, -50, 50, 0, 255);
            ofSetColor(bright);
            ofRect(rectWidth * 2, i * rectHeight, rectWidth, rectHeight);
        }
        if (_invader.getSensorTemperatureSolarMX(available[i], &value) == SATERROR_OK) {
            int bright = ofMap(value, -50, 50, 0, 255);
            ofSetColor(bright);
            ofRect(rectWidth * 3, i * rectHeight, rectWidth, rectHeight);
        }
        if (_invader.getSensorTemperatureSolarMY(available[i], &value) == SATERROR_OK) {
            int bright = ofMap(value, -50, 50, 0, 255);
            ofSetColor(bright);
            ofRect(rectWidth * 4, i * rectHeight, rectWidth, rectHeight);
        }
        if (_invader.getSensorTemperatureSolarMZ(available[i], &value) == SATERROR_OK) {
            int bright = ofMap(value, -50, 50, 0, 255);
            ofSetColor(bright);
            ofRect(rectWidth * 5, i * rectHeight, rectWidth, rectHeight);
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

