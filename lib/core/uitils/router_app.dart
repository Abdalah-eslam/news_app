import 'package:go_router/go_router.dart';
import 'package:news_app/feature/data/newsModels/article.dart';
import 'package:news_app/feature/home_presentation/details_news_screen.dart';
import 'package:news_app/feature/home_presentation/news_home_screen.dart';

import 'package:news_app/feature/splash_screen.dart';

abstract class RouterApp {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: '/NewsHome',
        builder: (context, state) {
          return const NewsHomeScreen();
        },
      ),
      GoRoute(
        path: '/detailsNews',
        builder: (context, state) {
          return DetailsNewsScreen(article: state.extra as Article);
        },
      ),
    ],
  );
}
