import 'dart:io';
import 'dart:collection';

void main() {
  int priority = 0; // variable to hold priority

  // read the file
  File file = new File('input.txt');
  List<String> lines = file.readAsLinesSync();

  for (int i = 0; i < lines.length; i++) {
    String rucksack = lines[i];
    int mid = (rucksack.length / 2).floor();

    String firstComp = rucksack.substring(0, mid);
    String secondComp = rucksack.substring(mid);

    // Create two SplayTreeSets, one for each string
    SplayTreeSet set1 = SplayTreeSet.from(firstComp.split(""));
    SplayTreeSet set2 = SplayTreeSet.from(secondComp.split(""));

    // Find the common characters using the intersection method
    String commonChars = set1.intersection(set2).join("");
    // ASCII offset for lower case
    int value = commonChars.codeUnitAt(0) - 96;
    // and then reoffset for UPPER CASE
    if (value < 1){
      value += 58;
    }

    priority += value;

    // Print the common characters
    print('$firstComp $secondComp $commonChars $value');

  }
  print('Priority toal: $priority');
}