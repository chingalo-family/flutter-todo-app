import 'package:flutter/foundation.dart';

class PageModel extends ChangeNotifier{

  String _currentSubPage;

  int _currentIndex;

  int get currentIndex=> _currentIndex ?? 0;

  String get currentSubPage => _currentSubPage ?? '';

  void activateTable(int index){
    _currentIndex = index;
    _currentSubPage = null;
    notifyListeners();
  }

  void setCurrentSubPage(String name){
    _currentSubPage =name;
    notifyListeners();
  }
}