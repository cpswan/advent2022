import 'dart:io';

void main() {
  int sum = 0; // variable to hold sum
  int first = 0; // variable to hold first
  int second = 0; // variable to hold second
  int third = 0; // variable to hold third

  // read the file
  File file = new File('input.txt');
  List<String> lines = file.readAsLinesSync();

  for (int i = 0; i < lines.length; i++) {
    // check for empty lines
    if (lines[i].isEmpty) {
      // sum the block of numbers
      for (int j = i + 1; j < lines.length; j++) {
        if (lines[j].isEmpty) {
          if (sum > first) {
            third = second;
            second = first;
            first = sum;
            sum = 0;
            break;
          }
          if (sum > second) {
            third = second;
            second = sum;
            sum = 0;
            break;
          }
          if (sum > third) {
            third = sum;
            sum = 0;
            break;
          }
          sum = 0;
          break;
        }
        sum += int.parse(lines[j]);
      }
    }
  }
  int total = first + second + third;
  print('123: $first $second $third Total: $total');
}