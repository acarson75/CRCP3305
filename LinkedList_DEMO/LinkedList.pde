class LinkedList {
  Node head; // Piece of data and a pointer
  Node tail;
  Node l;

  LinkedList() {
    this.head = null;
    this.tail = null;

  }
    boolean isEmpty() {
      return length == 0;
    }
}
    int len() {
      //It returns an integer with the number of items in the list.
      const nodes = [];
      let current = this.head;
      while (current) {
        nodes.push(current.value);
        current = current.nect;
      }
      return node.join( ' -> ');
    }
    void addNode(String s) {
      //Adds the String s to the end of the list, repairing links, and then prints a message to the console stating that String s was added.
    }
    void deleteNode(String s) { 
      //Finds String s in the list (if it is in the list.  If it is in the list it will delete that node, repairing the links, and then print a message to the console stating that String s was deleted.  If it is not in the list, it will return an error statement "Item not in list.".  This will likely be the most challenging method to write.
    }
    Node get(String s) {  
      //Finds the Node containing the String s and returns the Node object.
    }
    void display() {
      //prints the contents of the list to the console.
    }
    boolean contains(String s) { 
      //Checks to see if the list contains String s and returns a boolean with the result.
    }
  }
