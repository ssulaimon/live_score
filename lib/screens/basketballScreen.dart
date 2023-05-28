import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_score_ui/api/api_calls.dart';
import 'package:live_score_ui/const/colors.dart';
import 'package:live_score_ui/models/fixtures_response.dart';
import 'package:live_score_ui/routes/routes.dart';
import 'package:live_score_ui/state_management/basketball_state.dart';
import 'package:live_score_ui/widgets/category_selector.dart';
import 'package:live_score_ui/widgets/matches_widgets.dart';
import 'package:provider/provider.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:go_router/go_router.dart';

class BasketballScreen extends StatelessWidget {
  const BasketballScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BasketBallCategory>(
          builder: (context, basketballCategory, child) {
        return Column(
          children: [
            SizedBox(
              height: 40,
              child: ListView.builder(
                  itemCount: BasketBallCategory.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategorySelector(
                      textColor: BasketBallCategory.categories[index] ==
                              basketballCategory.selectedCategory
                          ? AppColors.white
                          : AppColors.black,
                      name: BasketBallCategory.categories[index].countryName,
                      backGroundColor: BasketBallCategory.categories[index] ==
                              basketballCategory.selectedCategory
                          ? AppColors.black
                          : null,
                      onTap: () => basketballCategory.selectedCategory =
                          BasketBallCategory.categories[index],
                    );
                  }),
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
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Limited api access'))),
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
                sport: 'basketball',
                countryKey: basketballCategory.selectedCategory.countryId,
              ),
            ))
          ],
        );
      }),
    );
  }
}
