import 'package:flutter/material.dart';
import 'package:live_score_ui/routes/routes.dart';
import 'package:live_score_ui/state_management/basketball_state.dart';
import 'package:live_score_ui/state_management/bottom_state.dart';
import 'package:live_score_ui/state_management/category_state.dart';
import 'package:live_score_ui/state_management/favourite_state.dart';
import 'package:live_score_ui/state_management/navigator_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => FavouriteState(),
      ),
      ChangeNotifierProvider(
        create: (context) => CategoryState(),
      ),
      ChangeNotifierProvider(
        create: (context) => NavState(),
      ),
      ChangeNotifierProvider(
        create: (context) => BasketBallCategory(),
      ),
      ChangeNotifierProvider(
        create: (context) => BottomItemState(),
      ),
    ],
    child: MaterialApp.router(
      routerConfig: AppRoutes.goRouter,
    ),
  ));
}
