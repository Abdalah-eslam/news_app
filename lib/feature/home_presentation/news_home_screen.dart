import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/TextStyle.dart';
import 'package:news_app/feature/data/newsModels/news.dart';
import 'package:news_app/feature/home_presentation/searchscreen.dart';
import 'package:news_app/feature/home_presentation/today_news_screen.dart';
import 'package:news_app/feature/home_presentation/widgets/homebody.dart';

class NewsHomeScreen extends StatefulWidget {
  const NewsHomeScreen({super.key});

  @override
  _NewsHomeScreenState createState() => _NewsHomeScreenState();
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {
  int _selectedIndex = 0;
  bool isslected = true;

  List<Widget> tabItems = [Homebody(), TodayNewsBody(), Searchscreen()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(child: Center(child: tabItems[_selectedIndex])),
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.easeInOut,
        selectedIndex: _selectedIndex,
        iconSize: 30,
        showElevation: false,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          isslected = false;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Home',
              style: isslected
                  ? TextStyle(color: Colors.grey)
                  : CustomTextstyle.text18BoldOrange,
            ),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.today),
            title: Text(
              'Today',
              style: isslected
                  ? TextStyle(color: Colors.grey)
                  : CustomTextstyle.text18BoldOrange,
            ),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.search),
            title: Text(
              'Search',
              style: isslected
                  ? TextStyle(color: Colors.grey)
                  : CustomTextstyle.text18BoldOrange,
            ),
          ),
        ],
      ),
    );
  }
}
