import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:live_score_ui/abstracts/api_functions_abstract.dart';
import 'package:live_score_ui/const/credentials.dart';
import 'package:live_score_ui/models/fixtures_response.dart';
import 'package:live_score_ui/models/news_model.dart';
import 'package:live_score_ui/models/standing_model.dart';

class ApiCall extends ApiFunctionsAbstract {
  static DateTime startDate = DateTime.now();
  static DateTime endDate = DateTime.now().add(const Duration(days: 30));

  @override
  static Future<List<FixturesResponse>?> getMatchFixturesFootball({
    required String countryKey,
    required String sport,
  }) async {
    String baseUrl =
        'https://apiv2.allsportsapi.com/$sport/?met=Fixtures&APIkey=${Credentials.apiKey}&from=${startDate.year.toString()}-${startDate.month.toString()}-${startDate.day.toString()}&to=${endDate.year.toString()}-${endDate.month.toString()}-${endDate.day.toString()}&countryId=$countryKey';
    var url = Uri.parse(baseUrl);
    Response response = await get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = await jsonDecode(response.body);

      List fixtures = await body['result'];
      List<FixturesResponse> fixturesResponse = List.generate(
        fixtures.length,
        (index) => FixturesResponse(
          awayTeamLogo: fixtures[index]['home_team_logo'],
          awayTeamName: fixtures[index]['event_away_team'],
          homeTeamLogo: fixtures[index]['home_team_logo'],
          homeTeamName: fixtures[index]['event_home_team'],
          leagueName: fixtures[index]['league_name'],
          leaguelogo: fixtures[index]['league_logo'],
          date: fixtures[index]['event_date'],
          time: fixtures[index]['event_time'],
        ),
      );
      return fixturesResponse;
    } else {
      log(response.statusCode.toString());
    }
  }

  static Future<List<StandingModel>?> getStandingFootball({
    required String leagueCode,
  }) async {
    String endPoint =
        'https://apiv2.allsportsapi.com/football/?met=Standings&APIkey=${Credentials.apiKey}&leagueId=$leagueCode';
    var url = Uri.parse(endPoint);
    Response response = await get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = await jsonDecode(response.body);
      List standing = await body['result']['total'];
      List<StandingModel> table = List.generate(
          standing.length,
          (index) => StandingModel(
              tiedMatch: standing[index]['standing_D'].toString(),
              playedMatch: standing[index]['standing_P'].toString(),
              point: standing[index]['standing_PTS'].toString(),
              win: standing[index]['standing_W'].toString(),
              loss: standing[index]['standing_L'].toString(),
              postion: standing[index]['standing_place'].toString(),
              teamName: standing[index]['standing_team']));
      log(table.length.toString());
      return table;
    } else {
      log(response.statusCode.toString());
    }
  }

  static Future<List<NewsModel>?> getLatestNews() async {
    String baseUrl =
        'https://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=${Credentials.sportNews}';
    var url = Uri.parse(baseUrl);
    Response response = await get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = await jsonDecode(response.body);
      List news = await body['articles'];
      List<NewsModel> newsModel = List.generate(
          news.length,
          (index) => NewsModel(
              publishDate: news[index]['publishedAt'].toString(),
              title: news[index]['title'],
              url: news[index]['url']));
      return newsModel;
    } else {
      log(response.statusCode.toString());
    }
  }
}
