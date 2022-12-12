import 'dart:io';

void main() {
  int currentdirectory = 0; // variable to hold size of current directory
  int parentdirectory = 0; // variable to hold size of parent directory
  int littledirs = 0; // variable to hold size of little directories
  int depth = 0; // we start at the root
  int maxdepth = 0; // lets see how deep this goes
  List<int> dirtotals = [0,0,0,0,0,0,0,0,0,0,0,0];

  // read the file
  File file = new File('input.txt');
  List<String> lines = file.readAsLinesSync();

  for (int i = 0; i < lines.length; i++) {
    var linefields = lines[i].split(" ");
    switch(linefields[0]) {
      case "\$": {
        switch(linefields[1]) {
          case "ls": {
            //print("got an ls command");
          }
          break;
          case "cd": {
            switch(linefields[2]) {
              case "/": {
                //print("at the start");
              }
              break;
              case "..": {
                depth -= 1;
                if (currentdirectory <= 100000) {
                  littledirs += currentdirectory;
                  print ("small leaf directory added $currentdirectory for a running total of $littledirs");
                }
                for (int j = depth; j > 0; j--) {
                  if (currentdirectory + dirtotals[depth] <= 100000) littledirs += dirtotals[depth];
                  print ("small directory above too added ${dirtotals[depth]} for a running total of $littledirs");
                }
                currentdirectory = 0;
                //print("going up");
              }
              break;
              default: {
                depth += 1;
                if (depth > maxdepth) maxdepth = depth;
                parentdirectory = currentdirectory;
                dirtotals[depth] = currentdirectory;
                currentdirectory = 0;
                print("going into ${linefields[2]}");
              }
              break;
            }
          }
        }
        
      }
      break;
      case "dir": {
        //print("found a directory ${linefields[1]}");;
      }
      break;
      default: {
        int filesize = int.parse(linefields[0]);
        currentdirectory += filesize;
        if (currentdirectory < 100000) {
          print("file size is $filesize directory total so far is $currentdirectory");
        }
      }
      break;
    }
  }
  print('littledirs: $littledirs');
  print('maxdepth: $maxdepth');
  print('finaldepth: $depth');
}