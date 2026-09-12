import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  int _total = 0;
  int get total => _total;

  String _condition = 'The user logged out';
  String get condition => _condition;

  void changeCondition(String newCondition) {
    _condition = newCondition;
    notifyListeners();
  }

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
