#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"
#include "ofxARTSATAPI.h"

class testApp : public ofxiOSApp, private ofxSAT::Notifier {
	
public:
    void setup();
    void update();
    void draw();
    void exit();
	
    void touchDown(ofTouchEventArgs & touch);
    void touchMoved(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchDoubleTap(ofTouchEventArgs & touch);
    void touchCancelled(ofTouchEventArgs & touch);
    
    void lostFocus();
    void gotFocus();
    void gotMemoryWarning();
    void deviceOrientationChanged(int newOrientation);
    
    ofxInvaderSAT _invader;
    virtual void onNotifyTLE(ofxSAT::TLERec const& tle, ofxSATTime const& time);
    virtual void onNotifyData(ofxSATTime const& time);
    
    std::vector<ofxSATTime> available;
    
    string tleString;
};


