#include "testApp.h"


//--------------------------------------------------------------
void testApp::setup(){
    ofBackground(224);
    ofSetFrameRate(30);
    
    bool result = response.open("http://api.artsat.jp/web/v2/invader/sensor_data.json");
    if (!result) {
        cout << "faild to get JSON data!" << endl;
    }
}

//--------------------------------------------------------------
void testApp::update(){

}

//--------------------------------------------------------------
void testApp::draw(){
    ofSetColor(63);
    int lineHeigt = 12;

    float lat = response["results"][0]["sensors"]["lat"]["value"].asFloat();
    ofDrawBitmapString("lat = " + ofToString(lat), 10, lineHeigt*1);
    float lon = response["results"][0]["sensors"]["lon"]["value"].asFloat();
    ofDrawBitmapString("lon = " + ofToString(lon), 10, lineHeigt*2);
    float alt = response["results"][0]["sensors"]["alt"]["value"].asFloat();
    ofDrawBitmapString("alt = " + ofToString(alt), 10, lineHeigt*3);
    float ax = response["results"][0]["sensors"]["ax"]["value"].asFloat();
    ofDrawBitmapString("ax = " + ofToString(ax), 10, lineHeigt*4);
    float ay = response["results"][0]["sensors"]["ay"]["value"].asFloat();
    ofDrawBitmapString("ay = " + ofToString(ay), 10, lineHeigt*5);
    float az = response["results"][0]["sensors"]["az"]["value"].asFloat();
    ofDrawBitmapString("az = " + ofToString(az), 10, lineHeigt*6);
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

