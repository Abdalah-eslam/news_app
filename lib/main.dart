import 'package:flutter/material.dart';
import 'package:news_app/core/uitils/router_app.dart';

import 'package:news_app/feature/splash_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterApp.router,

      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(colorSchemeSeed: Colors.white70, useMaterial3: true),
    );
  }
}
