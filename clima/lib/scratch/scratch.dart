import 'dart:io';

void main() {
  String str1 = task1();
  task2();
  String str2 = task3();
  // List<Future<String>> futures = [task1(), task2(), task3()];
  // await Future.wait(futures);
}

String task1() {
  String result = "task 1 data";
  print("Task 1 complete");
  return result;
}
Future<String> task2() async {
  String result;
  Duration threeSeconds = Duration(seconds: 3);
  Future.delayed(threeSeconds, () {
    result  = "task 2 data";
    print("Task 2 complete");
  });
  
  return result;
}
String task3() {
  String result = "task 3 data";
  print("Task 3 complete");
  return result;
}