class Timer {

  int oritime;
public  int currentTime;
  int totalTime=millis();
  int now;
  int nowsec;
public  int timepast;

  Timer(int oritime) {
    currentTime =oritime;
    nowsec = floor(currentTime/60);
    now = floor(totalTime/1000);
  }

 int count() {
   timepast=now-nowsec;
   return timepast;
 }
}