class FixturesResponse {
  String homeTeamName;
  String awayTeamName;
  String homeTeamLogo;
  String awayTeamLogo;
  String leagueName;
  String leaguelogo;
  String date;
  String time;
  FixturesResponse({
    required this.date,
    required this.time,
    required this.awayTeamLogo,
    required this.awayTeamName,
    required this.homeTeamLogo,
    required this.homeTeamName,
    required this.leagueName,
    required this.leaguelogo,
  });
}
