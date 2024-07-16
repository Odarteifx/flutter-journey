import 'package:flutter/material.dart';

class Riverpodmodel extends ChangeNotifier {
  int counter;
  Riverpodmodel({
    required this.counter,
  });

  void counterAdd() {
    counter++;
    notifyListeners();
  }

  void counterRemove(){
    counter--;
    notifyListeners();
  }
}
