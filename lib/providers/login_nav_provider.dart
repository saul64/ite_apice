import 'package:flutter/widgets.dart';

class LoginNavProvider extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  void updateIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }
}
