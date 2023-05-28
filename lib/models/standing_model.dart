class StandingModel {
  String teamName;
  String postion;
  String point;
  String win;
  String loss;
  String playedMatch;
  String tiedMatch;
  StandingModel({
    required this.playedMatch,
    required this.tiedMatch,
    required this.loss,
    required this.point,
    required this.win,
    required this.postion,
    required this.teamName,
  });
}
