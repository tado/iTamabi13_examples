#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    ofBackground(224);
    ofSetFrameRate(30);
    
    // ARTSAT WebAPIにアクセスしてJSONデータを取得
    bool result = artsatResponse.open("http://api.artsat.jp/web/v2/invader/sensor_data.json");
    
    // 取得結果をコンソールに出力
    if (!result) {
        // もし取得できなかったら、エラーを出力
        cout << "faild to get JSON data!" << endl;
    } else {
        // Artsat API取得に成功
        cout << artsatResponse.getRawString() << endl;
        // 取得した緯度経度で、Stary Sky APIにアクセス
        float lat = artsatResponse["results"][0]["sensors"]["lat"]["value"].asFloat();
        float lon = artsatResponse["results"][0]["sensors"]["lon"]["value"].asFloat();
        
        string URL = "http://www.walk-in-starrysky.com/star.do?cmd=display&year=2015&month=1&day=1&latitude=" + ofToString(lat) + "&longitude=" + ofToString(lon);
        ofRegisterURLNotification(this);
        ofLoadURLAsync(URL,"load");
    }

}

void testApp::urlResponse(ofHttpResponse &httpResponse){
    if(httpResponse.status==200 ){  // i.e is it ok
        xml.loadFromBuffer(httpResponse.data);
    }
    
    // starrysky 取得結果
    string xmlString;
    xml.copyXmlToString(xmlString);
    cout << "xml = " << xmlString << endl;
    
    // XMLをパース
    xml.pushTag("starrysky", 0);
    for (int i = 0; i < xml.getNumTags("star"); i++) {
        xml.pushTag("star", i);
        Star s;
        s.rightAscension = xml.getValue("rightAscension", "0:0:0");
        s.celestialDeclination = xml.getValue("celestialDeclination", "0:0:0");
        s.visualGradeFrom = xml.getValue("visualGradeFrom", 0.0);
        s.direction = xml.getValue("direction", 0.0);
        s.altitude = xml.getValue("altitude", 0.0);
        cout << s.rightAscension << ", " << s.celestialDeclination << ", " << s.visualGradeFrom << ", " << s.direction << ", " <<  s.altitude << endl;
        
        // Starクラスの配列に追加
        stars.push_back(s);
        
        xml.popTag();
    }
    xml.popTag();
}

//--------------------------------------------------------------
void testApp::update(){

}

//--------------------------------------------------------------
void testApp::draw(){
    ofSetColor(63);

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

