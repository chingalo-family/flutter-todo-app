import 'package:flutter/foundation.dart';

class PageModel extends ChangeNotifier {
  String _currentPageTitle;
  int _currentIndex;

  // selectors
  int get currentIndex => _currentIndex ?? 0;

  String get currentPageTitle => _currentPageTitle ?? 'Todo App';

  // Actions on reducers

  void activateTable(int index) {
    _currentIndex = index;
    _currentPageTitle = index == 0
        ? 'Todo App - Summary'
        : index == 1 ? 'Todo App - List' : 'Todo App';
    notifyListeners();
  }

  void setCurrentPageTitle(String name) {
    _currentPageTitle = name;
    notifyListeners();
  }
}
