import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  int _total = 0;
  int get total => _total;

  void increment() {
    _count++;
    _total = _count * 100;
    notifyListeners();
  }

  void decrement() {
    if (_count <= 0) return;
    _count--;
    _total = count * 100;
    notifyListeners();
  }

  void reset() {
    if (_count <= 0) return;
    _count = _total = 0;
    notifyListeners();
  }
}
