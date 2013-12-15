#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"
#include "ofxJSONElement.h"

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
    
    ofxJSONElement  artsatResponse; //ARTSAT APIの結果を格納
    ofxJSONElement  geocodingResponse; //GEOCODING APIの結果を格納
    //string responseStr;
    string country_long_name; //取得国名(ロング)
    string country_short_name; //取得国名(ショート)
    int country_index; //国番号
    ofImage backImg; //背景画像
    ofImage charaImg; //キャラ画像
};

