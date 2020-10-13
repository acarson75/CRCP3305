void setup() { 

  int ulam = 15;

  System.out.println("n = " + ulam);
  System.out.println("");
  System.out.print("" + ulam);

  if (ulam == 1) {
    System.out.println(" ->");
    return;
  }
  recursion(ulam);
  System.out.println(" -> 1");
} 

int recursion(int ulam) {
  if (ulam == 1)
  { 
    return 1;
  } else if (ulam == 2) { 
    return 1;
  } else if (ulam % 2 == 0) {
    ulam = ulam / 2;
    System.out.print(" -> " + ulam);
    recursion(ulam);
  } else {
    ulam = ulam * 3 + 1;
    System.out.print(" -> " + ulam);
    recursion(ulam);
  } 
  return 1;
}
