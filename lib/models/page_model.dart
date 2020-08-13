import 'package:flutter/foundation.dart';

class PageModel extends ChangeNotifier {
  String _currentSubPage;
  String _currentPageTitle;
  int _currentIndex;

  // selectors
  int get currentIndex => _currentIndex ?? 0;

  String get currentSubPage => _currentSubPage ?? '';

  String get currentPageTitle => _currentPageTitle ?? 'Todo App';

  // Actions on reducers

  void activateTable(int index) {
    _currentIndex = index;
    _currentSubPage = null;
    notifyListeners();
  }

  void setCurrentSubPage(String name) {
    _currentSubPage = name;
    notifyListeners();
  }

  void setCurrentPageTitle(String name) {
    _currentPageTitle = name;
    notifyListeners();
  }
}
