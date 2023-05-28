import 'package:flutter/cupertino.dart';
import 'package:live_score_ui/models/basketball_league_model.dart';

class BasketBallCategory extends ChangeNotifier {
  static List<BasketballLeagueModel> categories = [
    BasketballLeagueModel(
      countryName: 'France',
      countryId: '189',
    ),
    BasketballLeagueModel(
      countryName: 'Germany',
      countryId: '190',
    ),
  ];
  BasketballLeagueModel _selectedCategory = categories[0];
  BasketballLeagueModel get selectedCategory => _selectedCategory;

  set selectedCategory(BasketballLeagueModel basketBallCategory) {
    _selectedCategory = basketBallCategory;
    notifyListeners();
  }
}
