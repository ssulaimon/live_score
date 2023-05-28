import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_score_ui/api/api_calls.dart';
import 'package:live_score_ui/const/colors.dart';
import 'package:live_score_ui/models/fixtures_response.dart';
import 'package:live_score_ui/routes/routes.dart';
import 'package:live_score_ui/state_management/category_state.dart';
import 'package:live_score_ui/widgets/category_selector.dart';
import 'package:live_score_ui/widgets/matches_widgets.dart';
import 'package:provider/provider.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:go_router/go_router.dart';

class FootBallScreen extends StatelessWidget {
  const FootBallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Consumer<CategoryState>(builder: (context, categorySelector, child) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: CategoryState.leagues.length,
                  itemBuilder: (context, index) {
                    return CategorySelector(
                      onTap: () {
                        categorySelector.leaguesModel =
                            CategoryState.leagues[index];
                      },
                      textColor: CategoryState.leagues[index] ==
                              categorySelector.leaguesModel
                          ? AppColors.white
                          : AppColors.black,
                      backGroundColor: CategoryState.leagues[index] ==
                              categorySelector.leaguesModel
                          ? AppColors.black
                          : null,
                      name: CategoryState.leagues[index].name,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'UPCOMING FIXTURES',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.push(
                      RouteNames.table,
                    ),
                    child: Text(
                      'View Table',
                      style: GoogleFonts.roboto(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: TextAnimator(
                        'Getting fixtures',
                        atRestEffect: WidgetRestingEffects.wave(),
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Something Went Wrong',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                        ),
                      ),
                    );
                  } else {
                    List<FixturesResponse> fixtures =
                        snapshot.data as List<FixturesResponse>;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return MatchesWidget(
                          time: fixtures[index].time,
                          date: fixtures[index].date,
                          awayTeam: fixtures[index].awayTeamName,
                          awayTeamlogo: fixtures[index].awayTeamLogo,
                          homeTeam: fixtures[index].homeTeamName,
                          homeTeamLogo: fixtures[index].homeTeamLogo,
                        );
                      },
                      itemCount: fixtures.length,
                    );
                  }
                },
                future: ApiCall.getMatchFixturesFootball(
                  sport: 'football',
                  countryKey: categorySelector.leaguesModel.countryId,
                ),
              ))
            ],
          ),
        );
      }),
    );
  }
}
