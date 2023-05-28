import 'package:flutter/cupertino.dart';
import 'package:live_score_ui/models/favourite_team_model.dart';

class FavouriteState extends ChangeNotifier {
  int? _selectedIndex;
  int? get selectedIndex => _selectedIndex;
  set selectedIndex(int? index) {
    _selectedIndex = index;
    notifyListeners();
  }

  FavouriteTeamModel? _favouriteTeamModel;
  FavouriteTeamModel? get favouriteTeamModel => _favouriteTeamModel;
  set favouriteTeamModel(FavouriteTeamModel? team) {
    _favouriteTeamModel = team;
    notifyListeners();
  }
}
