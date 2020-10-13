

void setup () {
  int ulam = 15;
  boolean complete = false;

  println("n = " + ulam);
  println("");

void keyPressed() {
 if (key == '\n') {
   
  
}




  if (ulam == 1) {
    print( "1 ->");
    return;
  } else {
    print( "" + ulam);
  }
  while (!complete) {
    if (ulam == 1) {
      complete = true;
      print(" -> 1");
    } else if (ulam == 2) {
      complete = true;
      ulam = ulam / 2;
      print(" -> 1");
    } else if (ulam % 2 == 0) {
      ulam = ulam / 2;
      print(" -> " + ulam);
    } else {
      ulam = 3 * ulam + 1;
      print(" -> " +ulam);
    }
  }
}
