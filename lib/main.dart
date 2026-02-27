import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/core/uitils/di_convig.dart';
import 'package:news_app/core/uitils/router_app.dart';
import 'package:news_app/feature/data/repos/home_repo_impl.dart';
import 'package:news_app/feature/home_presentation/cubits/news_cubit.dart';
import 'package:news_app/feature/home_presentation/cubits/searchCubit/search_cubit.dart';
import 'package:news_app/feature/home_presentation/cubits/trending_cubit_cubit.dart';

void main() {
  setupDi();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              NewsCubit(homeRepoImpl: getIt<HomeRepoImpl>())..fetchNews(),
        ),
        BlocProvider(
          create: (context) =>
              TrendingCubitCubit(homeRepoImpl: getIt<HomeRepoImpl>())
                ..fetchTrending(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(homeRepoImpl: getIt<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: RouterApp.router,

        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData(colorSchemeSeed: Colors.white70, useMaterial3: true),
      ),
    );
  }
}
