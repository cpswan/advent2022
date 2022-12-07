import 'dart:io';

void main() {
  // read the file
  File file = new File('input.txt');
  List<String> lines = file.readAsLinesSync();
  String signal = lines[0];
  for (int i = 3; i < signal.length; i++) {
    var ids = [signal[i-3], signal[i-2], signal [i-1], signal [i]];
    var distinctIds = ids.toSet().toList();
    print(ids);
    if (distinctIds.length == 4) {
      print(i);
      break;
    }
  }
}