import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/apiservice.dart';
import 'package:news_app/core/uitils/router_app.dart';
import 'package:news_app/feature/data/repos/home_reop_impl.dart';
import 'package:news_app/feature/home_presentation/news_cubit/news_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsCubit(HomeRepoImpl(apiservice: Apiservice()))..fetchNews(),

      child: MaterialApp.router(
        routerConfig: RouterApp.router,

        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData(colorSchemeSeed: Colors.white70, useMaterial3: true),
      ),
    );
  }
}
