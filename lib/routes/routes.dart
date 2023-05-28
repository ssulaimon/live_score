import 'package:go_router/go_router.dart';
import 'package:live_score_ui/screens/favouriteScreen.dart';
import 'package:live_score_ui/screens/homeScreen.dart';
import 'package:live_score_ui/screens/splashScreen.dart';
import 'package:live_score_ui/screens/viewTableScreen.dart';

class AppRoutes {
  static GoRouter goRouter = GoRouter(routes: [
    GoRoute(
      path: RouteNames.splashScreen,
      builder: (context, state) => const SplasScreen(),
    ),
    GoRoute(
      path: RouteNames.favourite,
      builder: (context, state) => const FavouriteScreen(),
    ),
    GoRoute(
        path: RouteNames.home, builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: RouteNames.table,
      builder: (context, state) => const ViewTableScreen(),
    )
  ]);
}

class RouteNames {
  static const splashScreen = '/';
  static const favourite = '/favourite';
  static const home = '/home';
  static const table = '/table';
}
