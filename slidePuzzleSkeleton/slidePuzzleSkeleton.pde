///////////////////////////////////////////////////
//    Sliding tile puzzle game.  Smith.  2020    //
//  Yes, of course I have the solution to this.  //
///////////////////////////////////////////////////

//  See instructions tab

// Global declarations:
// Below is a 2d array that reflects the current state of the puzzle board.  It is mixed later.
int[][] current = {{16, 16, 16, 16}, {16, 16, 16, 16}, {16, 16, 16, 16}, {16, 16, 16, 16}};
// Below is a  2d array that reflects the state of a solved puzle board.
int[][] solved = {{1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12}, {13, 14, 15, 0}};
int numberOfMoves = 0; // Counts the number of moes it takes to get to a solution
String bannerMessage = "";  // Message at bottom of screen
String movesMessage = "";  // Another mesage at bottom of screen
int blockSize = 100;  // size of tiles on puzzle board
int blankX = 0;  // X index of blank tile (0), used for determining valid moves 
int blankY = 0;  // Y index of blank tile (0), used for determining valid moves
int diagonal;
PFont roboto;

//  The function below is complete - no need to change any of it, unless you are beautifying output.
void setup() {
  size(400, 525);  //  Set display window
  initGame(); // reset game paremeters for a new game
  smooth();
  roboto = createFont("Roboto-Regular.ttf", 40); 
}
//  The function below is complete - no need to change any of it, unless you are beautifying output.
void draw() {
  background(0, 106, 209);  // Dark Blue Background
  displayPuzzle();  // display the puzzle board
  if (isSolved()) {  // function call in conditional checks to see if puzzle is solved 
    bannerMessage = "Congratulations! Press N for new game.";
    displayBanners();
  }
}


//  The function below is complete - no need to change any of it, unless you are beautifying output.
void initGame() {  // Resets parameters for a new game
  for (int i = 0; i < 4; i ++) {  //  Nested loops prep current board for new mixup
    for (int j = 0; j < 4; j ++) {
      current[i][j] = 16;
    }
  }
  numberOfMoves = 0;  // reset move counter
  bannerMessage = "Press H-Help  A-About  N-New Puzzle";  // reset banner
  mixPuzzle();  // function call to mix up puzzle board
}

//  The function below is complete - no need to change any of it, unless you are beautifying output.
void mixPuzzle() { // sets the current state to a randomly mixed puzzle
  int num = int(random(16));  // picks a new random integer between 0 and 15
  boolean used = true;  // sets flag
  for (int i = 0; i < 4; i ++) {  // nested loops step through entire puzzle to set new values
    for (int j = 0; j < 4; j ++) {
      while (used) { // keeps generating a random number until it finds one that is unused (no repeats)
        num = int(random(16));
        used = false;
        for (int k = 0; k < 4; k++) {  // checks puzzle to see if current random number has been used
          for (int l = 0; l < 4; l++) {
            if (num == current[k][l]) {
              used = true;
            }
          }
        }
      }
      current[j][i] = num;  // Finally assigns unused number to next cell in array
      if (num == 0) {  // Keeps track of the location of the blank tile (value 0)
        blankX = i;
        blankY = j;
      }
      used = true;
    }
  }
}

//  The function below is complete - no need to change any of it, unless you are beautifying output.
void displayPuzzle() { // displays puzzle on board
  textSize(35);
  textAlign(CENTER, CENTER);
  for (int i = 0; i < 4; i++) { // Steps through array, determining position, color, and values based on array
    for (int j = 0; j < 4; j++) {
      if (current[j][i] == 0) {
        strokeWeight(3);
        rect(i * blockSize, j * blockSize, blockSize, blockSize, 10);
      } else {
        fill(30, 144, 255); // Light Blue
        stroke(0, 106, 209); // Dark Blue
        strokeWeight(4);
        rect(i * blockSize, j * blockSize, blockSize, blockSize, 10);
        fill(250);
        textFont(roboto);
        text(current[j][i], i*blockSize + (blockSize/2), j*blockSize + (blockSize/2));
      }
    }
  }
  displayBanners();  // function call displays appropriate meesage at bottom of screen
}

//  The function below is complete - no need to change any of it, unless you are beautifying output.
int whichY() { // return the x index for the position that was clicked, 4 if invalid
  int index = 4;
  if (mouseX <= (blockSize * 4) && mouseY <= (blockSize * 4)) {  // checks to see mouse on the board
    index = mouseY/blockSize;
  }
  return index;
}

//  The function below is complete - no need to change any of it, unless you are beautifying output.
int whichX() {
  int index = 4;
  if (mouseX <= (blockSize * 4) && mouseY <= (blockSize * 4)) {  // checks to see mouse on the board
    index = mouseX/blockSize;
  }
  return index;
}

//  The function below is complete - no need to change any of it, unless you are beautifying output.
void displayBanners() { // dispalys the current banner messages
  stroke(50);
  strokeWeight(4);
  fill(60);
  rect(0, height * 0.765, width, height, 40);
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("Can you complete the puzzle?", width/2, height * .86);
  text(bannerMessage, width/2, height * .93);
  text("Moves: " + numberOfMoves, width/2, height * .97);
}

//  The function below is complete - no need to change any of it, unless you are beautifying output.
void keyPressed() { // runs once every time key is pressed
  if (bannerMessage != "Press H-Help  A-About  N-New Puzzle") {  // goes back to default message
    bannerMessage = "Press H-Help  A-About  N-New Puzzle";
  }
  if (key == 'A' || key == 'a') { // Dispaly "about" message
    bannerMessage = "Slide Puzzle, 2020, CRCP-3305";
  }
  if (key == 'H' || key == 'h') { // Display "Help" message
    bannerMessage = "Click tiles adjacent to blank space until solved";
  }
  if (key == 'N' || key == 'n') { // Reset the game
    initGame();  // Function resets all parameters
  }
}

boolean moveIsValid () { // checks to see if the mouse clicked on a square that is valid move.
  boolean valid = false;
  int moveY = whichY();
  int moveX = whichX();
  // Code that checks to see if the blank tile is adjacent to the tile that was clicked.
  if (((moveY + 1 == blankY || moveY - 1 == blankY) && (moveX == blankX)) || ((moveX + 1 == blankX || moveX - 1 == blankX) && (moveY == blankY))) {
    valid = true;
  } else {
    valid = false;
  }
  return valid;
}

void registerMove () { // changes the current array - only called if move is valid
  int moveY = whichY();
  int moveX = whichX();

  current[blankY][blankX] = current[moveY][moveX];
  current[moveY][moveX] = 0;
  blankX = moveX;
  blankY = moveY;
}

boolean isSolved() { // compares current board to solved board - returns true if solved
  if (current == solved) {
    return true;
  } else {
    return false;
  }
}

void mouseClicked() { // runs once every time mouse is clicked
  String message = "";
  if (moveIsValid()) {
    message = "Valid move!";
    numberOfMoves++;
    registerMove();
  } else {
    message = "Invalid move!";
  }
  println(message);
}
