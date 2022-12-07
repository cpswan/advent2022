import 'dart:io';

void main() {
  int score = 0; // variable to hold score

  // read the file
  File file = new File('input.txt');
  List<String> lines = file.readAsLinesSync();

  for (int i = 0; i < lines.length; i++) {
    switch(lines[i]) {
      case "A X": {
        score += 3;
      }
      break;
      case "B X": {
        score += 1;
      }
      break;
      case "C X": {
        score += 2;
      }
      break;
      case "A Y": {
        score += 4;
      }
      break;
      case "B Y": {
        score += 5;
      }
      break;
      case "C Y": {
        score += 6;
      }
      break;
      case "A Z": {
        score += 8;
      }
      break;
      case "B Z": {
        score += 9;
      }
      break;
      case "C Z": {
        score += 7;
      }
      break;
    }
  }
  print('score: $score');
}