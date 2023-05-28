import 'package:flutter/cupertino.dart';
import 'package:live_score_ui/screens/basketballScreen.dart';
import 'package:live_score_ui/screens/footballScreen.dart';
import 'package:live_score_ui/screens/topscorersScreen.dart';

class NavState extends ChangeNotifier {
  static const List<Widget> sports = [
    FootBallScreen(),
    BasketballScreen(),
    TopScorersScreen()
  ];
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
