import 'dart:io';

void main() {
  int currentdirectory = 0; // variable to hold size of current directory
  int parentdirectory = 0; // variable to hold size of parent directory
  int lastparent = 0; // variable to hold size of parent directory
  int littledirs = 0; // variable to hold size of little directories
  int depth = 0; // we start at the root
  int maxdepth = 0; // lets see how deep this goes

  // read the file
  File file = new File('input.txt');
  List<String> lines = file.readAsLinesSync();

  for (int i = 0; i < lines.length; i++) {
    var linefields = lines[i].split(" ");
    switch(linefields[0]) {
      case "\$": {
        switch(linefields[1]) {
          case "ls": {
            print("got an ls command");
          }
          break;
          case "cd": {
            switch(linefields[2]) {
              case "/": {
                print("at the start");
              }
              break;
              case "..": {
                depth -= 1;
                if (currentdirectory <= 100000) littledirs += currentdirectory;
                if (currentdirectory + parentdirectory <= 100000) littledirs += parentdirectory;
                if (currentdirectory + parentdirectory + lastparent <= 100000) littledirs += lastparent;
                currentdirectory = 0;
                print("going up");
              }
              break;
              default: {
                depth += 1;
                if (depth > maxdepth) maxdepth = depth;
                lastparent = parentdirectory;
                parentdirectory = currentdirectory;
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
        print("found a directory ${linefields[1]}");;
      }
      break;
      default: {
        int filesize = int.parse(linefields[0]);
        currentdirectory += filesize;
        print("file size is $filesize directory total so far is $currentdirectory");
      }
      break;
    }
  }
  print('littledirs: $littledirs');
  print('maxdepth: $maxdepth');
  print('finaldepth: $depth');
}