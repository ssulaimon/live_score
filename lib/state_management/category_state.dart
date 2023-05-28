import 'package:flutter/cupertino.dart';
import 'package:live_score_ui/models/leagues_model.dart';

class CategoryState extends ChangeNotifier {
  static List<LeaguesModel> leagues = [
    LeaguesModel(
      countryId: '50',
      leagueId: '177',
      name: 'Premier League',
    ),
    LeaguesModel(countryId: '73', leagueId: '423', name: 'Cup')
  ];
  LeaguesModel _leaguesModel = leagues[0];
  LeaguesModel get leaguesModel => _leaguesModel;
  set leaguesModel(LeaguesModel leaguesModel) {
    _leaguesModel = leaguesModel;
    notifyListeners();
  }
}
