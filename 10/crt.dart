import 'dart:io';

int checkstep(int cycle, int register) {
  int signal = 0;
  if ((cycle-20) % 40 == 0) {
    print("Hit ${cycle}");
    print("Regsiter is at ${register}");
    signal = cycle * register;
    print("Signal sum is at ${signal}");
  }
  return signal;
}

void main() {
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
        valuesum += checkstep(cycle,register);
      }
      break;
      default: {
        cycle += 1;
        valuesum += checkstep(cycle,register);
        cycle += 1;
        addreg = int.parse(lines[i].split(" ")[1]);
        register += addreg;
        print("Added ${addreg} to the register, which now holds ${register}");
        valuesum += checkstep(cycle,register);
      }
    }
  }
  print('final cycle: $cycle');
  print("Final value sum is at ${valuesum}");
}