import 'dart:io';

void main() {
  // read the file
  File file = new File('input.txt');
  List<String> lines = file.readAsLinesSync();
  String signal = lines[0];
  for (int i = 13; i < signal.length; i++) {
    var ids = [signal[i-13], signal[i-12], signal [i-11], signal[i-10], signal[i-9], signal [i-8],signal[i-7], signal[i-6], signal [i-5], signal[i-4], signal[i-3], signal [i-2], signal [i-1], signal [i]];
    var distinctIds = ids.toSet().toList();
    print(ids);
    if (distinctIds.length == 14) {
      print(i);
      break;
    }
  }
}