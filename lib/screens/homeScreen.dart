import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_score_ui/const/colors.dart';

import 'package:live_score_ui/const/images_path.dart';
import 'package:live_score_ui/screens/newsScreen.dart';
import 'package:live_score_ui/state_management/bottom_state.dart';
import 'package:live_score_ui/state_management/navigator_state.dart';

import 'package:live_score_ui/widgets/navigation_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> bottomItems = [
      {
        "title": 'Home',
        'icon': const Icon(
          Icons.home,
        ),
      },
      {
        'title': 'News',
        'icon': const Icon(
          Icons.feed,
        ),
      }
    ];
    List<Widget> body = [
      NavState.sports[Provider.of<NavState>(context).currentIndex],
      const NewsScreen()
    ];
    return Consumer<BottomItemState>(builder: (context, bottomState, child) {
      return Scaffold(
        drawer: const CustomNavigator(),
        appBar: AppBar(
          title: Text(
            'Scora',
            style: GoogleFonts.roboto(color: AppColors.black),
          ),
          iconTheme: const IconThemeData(color: AppColors.black),
          elevation: 0.0,
          backgroundColor: AppColors.white,
        ),
        body: body[bottomState.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.primaryColor,
            selectedIconTheme:
                const IconThemeData(color: AppColors.primaryColor),
            currentIndex: bottomState.currentIndex,
            onTap: (index) => bottomState.currentIndex = index,
            items: bottomItems
                .map(
                  (item) => BottomNavigationBarItem(
                    label: item['title'],
                    icon: item['icon'],
                  ),
                )
                .toList()),
      );
    });
  }
}

class CustomNavigator extends StatelessWidget {
  const CustomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map> navItems = [
      {
        'name': 'Football',
        "iconPath": ImagesPath.football,
      },
      {
        'name': 'Basketball',
        "iconPath": ImagesPath.basketball,
      },
      {
        'name': 'Top Scorer',
        'iconPath': ImagesPath.topScore,
      }
    ];
    return Container(
      color: AppColors.white,
      margin: const EdgeInsets.only(right: 50),
      child: Consumer<NavState>(builder: (context, navState, child) {
        return ListView.builder(
          itemCount: navItems.length,
          itemBuilder: (context, index) {
            return NavigationWidge(
              onTap: () {
                navState.currentIndex = index;
                Navigator.pop(context);
              },
              iconPath: navItems[index]['iconPath'],
              name: navItems[index]['name'],
              textColor: navState.currentIndex == index
                  ? AppColors.primaryColor
                  : null,
            );
          },
        );
      }),
    );
  }
}
