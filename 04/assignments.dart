import 'dart:io';

void main() {
  int overlaps = 0; // variable to hold overlaps

  // read the file
  File file = new File('input.txt');
  List<String> lines = file.readAsLinesSync();
  for (int i = 0; i < lines.length; i++) {
    var commaline = lines[i].split(",");
    var lefthand=commaline[0].split("-");
    var righthand=commaline[1].split("-");
    int leftstart=int.parse(lefthand[0]);
    int leftend=int.parse(lefthand[1]);
    int rightstart=int.parse(righthand[0]);
    int rightend=int.parse(righthand[1]);
    if (rightend < leftstart) continue;
    if (leftend < rightstart) continue;
    if ((rightstart >= leftstart) && (rightend <= leftend)){
      overlaps +=1;
      print("$leftstart $leftend $rightstart $rightend");
      continue;
    }
    if ((leftstart >= rightstart) && (leftend <= rightend)){
      print("$leftstart $leftend $rightstart $rightend");
      overlaps +=1;
      continue;
    }


    //print("${leftstart} $leftend $rightstart $rightend ${commaline[0]} ${commaline[1]}");
  }
  print('overlaps: $overlaps');
}