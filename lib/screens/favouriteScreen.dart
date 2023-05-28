import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_score_ui/const/colors.dart';
import 'package:live_score_ui/const/images_path.dart';
import 'package:live_score_ui/models/favourite_team_model.dart';
import 'package:live_score_ui/routes/routes.dart';
import 'package:live_score_ui/state_management/favourite_state.dart';
import 'package:live_score_ui/widgets/custom_button.dart';
import 'package:live_score_ui/widgets/favourite_selector.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<FavouriteTeamModel> favouriteTeamModel = [
      FavouriteTeamModel(
        image: ImagesPath.arsenal,
        name: 'Arsenal',
      ),
      FavouriteTeamModel(
        image: ImagesPath.chelsea,
        name: 'Chelsea',
      ),
      FavouriteTeamModel(
        image: ImagesPath.manunited,
        name: 'Manchester United',
      ),
      FavouriteTeamModel(
        image: ImagesPath.city,
        name: 'Manchester City',
      ),
      FavouriteTeamModel(
        image: ImagesPath.liver,
        name: 'Liverpool',
      ),
      FavouriteTeamModel(
        image: ImagesPath.dotmond,
        name: 'Dortmund',
      ),
      FavouriteTeamModel(
        image: ImagesPath.barca,
        name: 'Barcelona',
      ),
      FavouriteTeamModel(
        image: ImagesPath.real,
        name: 'Real Madrid',
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child:
            Consumer<FavouriteState>(builder: (context, favouriteState, child) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Favourite Team',
                  style: GoogleFonts.roboto(fontSize: 30),
                ),
                Text(
                  'Please choose your favourite team',
                  style: GoogleFonts.roboto(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      color: AppColors.grey.withOpacity(
                        0.2,
                      ),
                      border: Border.all(
                        color: AppColors.black.withOpacity(
                          0.2,
                        ),
                      ),
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return FavouriteSelector(
                          ontap: () {
                            if (favouriteState.selectedIndex == index) {
                              favouriteState.selectedIndex = null;
                              favouriteState.favouriteTeamModel = null;
                            } else {
                              favouriteState.selectedIndex = index;

                              favouriteState.favouriteTeamModel =
                                  favouriteTeamModel[index];
                            }
                          },
                          favouriteTeamModel: favouriteTeamModel[index],
                          color: favouriteState.selectedIndex == index
                              ? AppColors.gold
                              : AppColors.black,
                        );
                      },
                      itemCount: favouriteTeamModel.length,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(
                    ontap: () {
                      if (favouriteState.favouriteTeamModel == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please choose your favourite team'),
                          ),
                        );
                      } else {
                        context.pushReplacement(RouteNames.home);
                      }
                    },
                    name: 'Continue',
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
