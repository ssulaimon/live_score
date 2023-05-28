abstract class ApiFunctionsAbstract {
  static Future<void> getMatchFixtures({
    required String leagueCode,
    String? countryCode,
  }) async {}

  static Future<void> getStanding({
    required String leagueCode,
  }) async {}
}
