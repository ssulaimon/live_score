import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_score_ui/const/colors.dart';

class MatchesWidget extends StatelessWidget {
  final String homeTeam;
  final String awayTeam;
  final String homeTeamLogo;
  final String awayTeamlogo;
  final String time;
  final String date;
  const MatchesWidget({
    super.key,
    required this.date,
    required this.time,
    required this.awayTeam,
    required this.awayTeamlogo,
    required this.homeTeam,
    required this.homeTeamLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text(
            date,
            style: GoogleFonts.roboto(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.grey.withOpacity(0.2),
            border: Border.all(
              color: AppColors.black.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Row(
            children: [
              Text(
                time,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Image.network(
                    homeTeamLogo,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                    awayTeamlogo,
                    height: 20,
                    width: 20,
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homeTeam,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    awayTeam,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
