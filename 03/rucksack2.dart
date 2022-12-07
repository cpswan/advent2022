import 'dart:io';
import 'dart:collection';

void main() {
  int priority = 0; // variable to hold priority

  // read the file
  File file = new File('input.txt');
  List<String> lines = file.readAsLinesSync();

  for (int i = 0; i < lines.length; i+=3) {
    String rucksack1 = lines[i];
    String rucksack2 = lines[i+1];
    String rucksack3 = lines[i+2];

    SplayTreeSet set1 = SplayTreeSet.from(rucksack1.split(""));
    SplayTreeSet set2 = SplayTreeSet.from(rucksack2.split(""));
    SplayTreeSet set3 = SplayTreeSet.from(rucksack3.split(""));

    // Find the common characters using the intersection method
    String commonChars = set1.intersection(set2).intersection(set3).join("");
    int value = commonChars.codeUnitAt(0) - 96;
    if (value < 1){
      value += 58;
    }

    priority += value;

    // Print the common characters
    print('$commonChars $value');

  }
  print('Priority toal: $priority');
}