import 'dart:io';
import 'dart:collection';

class Stack<T> {
  final _stack = Queue<T>();

  int get length => _stack.length;

  bool canPop() => _stack.isNotEmpty;
  
  void clearStack(){
    while(_stack.isNotEmpty){
      _stack.removeLast();
    }
  }

  void push(T element) {
    _stack.addLast(element);
  }

  T pop() {
    T lastElement = _stack.last;
    _stack.removeLast();
    return lastElement;
  }

  T peek() => _stack.last;

}

void main() {
  List<Stack<String>> stacks = [Stack(),Stack(),Stack(),Stack(),Stack(),Stack(),Stack(),Stack(),Stack(),Stack()];
  File startfile = new File('start.txt');
  List<String> startlines = startfile.readAsLinesSync();
  for (int i = startlines.length-1; i > -1; i--) {
    //print(startlines[i]);
    for(int j = 0; j < 9; j++) {
      String element = startlines[i][(j*4)+1];
      if (element != " "){
        stacks[j].push(element);
      }
    }
  }

  //print(stacks[0].peek());

  File movesfile = new File('moves.txt');
  List<String> moveslines = movesfile.readAsLinesSync();
  for (int i = 0; i < moveslines.length; i++) {
    var line = moveslines[i].split(" ");
    int numcrates=int.parse(line[1]);
    int fromcol=int.parse(line[3]);
    int tocol=int.parse(line[5]);
    //print("$numcrates $fromcol $tocol");
    for (int i = 1; i <= numcrates; i++) {
      String movecrate = stacks[fromcol-1].pop();
      stacks[9].push(movecrate);
    }
    for (int i = 1; i <= numcrates; i++) {
      String movecrate = stacks[9].pop();
      stacks[tocol-1].push(movecrate);
    }
  }

  for (int i = 0; i < 9; i++) {
    print(stacks[i].peek());
  }
}