LinkedList l1; // Declare link list class

void setup() {
  // Create a linked list
  l1 = new LinkedList();
  noLoop();
}

void draw() {
  l1.addNode("Smith");
  if (l1.isEmpty()) {
    println("Sorry, the list is empty");
  }
  // All of Smith's test commands go
}
