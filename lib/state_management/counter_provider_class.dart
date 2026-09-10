import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    if (counter == 0) return;
    _counter--;
    notifyListeners();
  }

  void reset() {
    if (_counter <= 0) return;
    _counter = 0;
    notifyListeners();
  }
}
