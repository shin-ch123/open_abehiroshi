boolean overButton = false;

// [ms]単位で時刻を取得するためのクラス
class ClockMillis
{
  // コンストラクタ（初期化関数、クラス名と同じ関数で記述すればよい）
  ClockMillis() {
    previous_second = second(); // 現在の時刻[s]の値を保存しておく
    timestamp = millis();  // 現在の時刻[ms]の値を保存しておく
  }

  // 時刻[ms]を取得する関数
  int get() {

    // もし現在時刻[s]が最後に保存された時刻[s]とことなる場合（一秒経過した場合）
    if ( second() != previous_second ) {
      previous_second = second();  // 現在の時刻[s]を保存しておく
      timestamp = millis(); // 現在の実行経過時間[ms]を保存しておく
    }
    // timestampはsecond()の値が変わるたびにそのタイミングでのmillis()を値を保存しているため、
    // millis()-timestamp を計算することで時刻[ms]を計測できる
    return (millis()-timestamp);
  }
  // クラス内で使用可能な変数（メンバ変数）の宣言
  int previous_second;
  int timestamp;
}

ClockMillis clock_millis;
void setup() {
  size(500, 500);
  textAlign(CENTER);
  clock_millis = new ClockMillis();
}

void draw()
{
  if (hour()==0&&minute()==0&&second()>=0) {
    background(255, 0, 0);
  } else {
    background(150);
  }
  textSize(45);
  text(nf(hour(), 2)+":"+nf(minute(), 2)+":"+nf(second(), 2), width/2, height/2);
  text(nf(clock_millis.get(), 4), width/2, height/2 + 50);

  if (overButton == true) {
    fill(255);
  } else {
    noFill();
  }
  rect(105, 60, 75, 75);
  line(135, 105, 155, 85);
  line(140, 85, 155, 85);
  line(155, 85, 155, 100);
}

void mousePressed() {
  if (overButton) {
    link("http://abehiroshi.la.coocan.jp/");
  }
}

void mouseMoved() {
  checkButtons();
}

void mouseDragged() {
  checkButtons();
}

void checkButtons() {
  if (mouseX > 105 && mouseX < 180 && mouseY > 60 && mouseY <135) {
    overButton = true;
  } else {
    overButton = false;
  }
}
