import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_score_ui/api/api_calls.dart';
import 'package:live_score_ui/const/colors.dart';
import 'package:live_score_ui/models/leagues_model.dart';
import 'package:live_score_ui/models/standing_model.dart';
import 'package:live_score_ui/state_management/category_state.dart';
import 'package:provider/provider.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class ViewTableScreen extends StatelessWidget {
  const ViewTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LeaguesModel leaguesModel =
        Provider.of<CategoryState>(context).leaguesModel;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: AppColors.black),
        backgroundColor: AppColors.white,
        title: Text(
          'Standing',
          style: GoogleFonts.roboto(color: AppColors.black),
        ),
      ),
      body: FutureBuilder(
        future: ApiCall.getStandingFootball(
          leagueCode: leaguesModel.leagueId,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: TextAnimator(
                'Getting Standing',
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
            List<StandingModel> standing = snapshot.data as List<StandingModel>;
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: InteractiveViewer(
                constrained: false,
                child: DataTable(
                    columns: [
                      DataColumn(
                          label: Text(
                        '#',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                      DataColumn(
                        label: Text(
                          'Team Name',
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'PTS',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'W',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'D',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'P',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                    rows: standing
                        .map(
                          (team) => DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  team.postion,
                                ),
                              ),
                              DataCell(
                                Text(team.teamName),
                              ),
                              DataCell(
                                Text(team.point),
                              ),
                              DataCell(
                                Text(team.win),
                              ),
                              DataCell(
                                Text(team.tiedMatch),
                              ),
                              DataCell(
                                Text(team.playedMatch),
                              )
                            ],
                          ),
                        )
                        .toList()),
              ),
            );
          }
        },
      ),
    );
  }
}
