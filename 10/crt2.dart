import 'dart:io';

const emptyrow = '...........................................';

String placeSpriteAt(String oldString, int index, String newChar) {
  return oldString.substring(0, index+2) + newChar + oldString.substring(index + 4);
}

String getChar(int cycle, int register) {
  print("On cycle ${cycle} with register at ${register}");
  String displaynow = emptyrow;
  displaynow = placeSpriteAt(emptyrow, register, '###');
  int column = cycle % 40;
  String foundchar = displaynow.substring(column+2,column+3);
  print(foundchar);
  return foundchar;
}

void main() {
  String raster = '#';
  int cycle = 1; // variable to hold cycle count
  int register = 1; // variable to hold register value
  int valuesum = 0;
  int addreg =0;

  // read the file
  File file = new File('input.txt');
  List<String> lines = file.readAsLinesSync();

  for (int i = 0; i < lines.length; i++) {
    switch(lines[i]) {
      case "noop": {
        cycle += 1;
        raster += getChar(cycle,register);
      }
      break;
      default: {
        cycle += 1;
        raster += getChar(cycle,register);
        cycle += 1;
        addreg = int.parse(lines[i].split(" ")[1]);
        register += addreg;
        //print("Added ${addreg} to the register, which now holds ${register}");
        raster += getChar(cycle,register);
      }
    }
  }
  //print(raster);
  for (int i=0; i<240; i+=40) {
    print(raster.substring(i,i+39));
  }
}