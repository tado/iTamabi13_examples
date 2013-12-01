#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"
#include "ofxARTSATAPI.h"
#include "ofxSgp.h"

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
    
    virtual void onNotifyTLE(ofxSAT::TLERec const& tle, ofxSATTime const& time);
    virtual void onNotifyData(ofxSATTime const& time);

    ofxInvaderSAT invader;
    ofxSgp sgp;
    std::vector<ofxSATTime> available;
    ofEasyCam camera;
    ofxSATTime epoch;
    ofxSATTime current;
    
    static const int EARTH_SIZE = 6378;
    static const int TIME_SCALE = 100;
    
    ofBoxPrimitive box;
    ofSpherePrimitive earth;
    ofImage earthTexture;
    
    ofMesh orbitMesh;    
};


