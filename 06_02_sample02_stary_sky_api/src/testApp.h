#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"
#include "ofxJSONElement.h"
#include "ofxXmlSettings.h"


class Star {
public:
    string rightAscension;
    string celestialDeclination;
    float visualGradeFrom;
    float direction;
    float altitude;
};

class testApp : public ofxiOSApp{
    
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
    
    ofxJSONElement  artsatResponse;

    ofxXmlSettings xml;
    void urlResponse(ofHttpResponse &httpResponse);
    vector<Star> stars;
};


