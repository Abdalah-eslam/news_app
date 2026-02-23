import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:news_app/core/TextStyle.dart';
import 'package:news_app/core/uitils/router_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

Future<void> initialization(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 3));

  RouterApp.router.go('/NewsHome');
  FlutterNativeSplash.remove();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    initialization(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'News', style: CustomTextstyle.text24BoldBlue),
                TextSpan(text: 'App', style: CustomTextstyle.text24BoldOrange),
              ],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
