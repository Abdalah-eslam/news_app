import 'package:flutter/material.dart';
import 'package:news_app/core/TextStyle.dart';
import 'package:news_app/feature/home/widgets/listview_newsCard.dart';

class Homebody extends StatelessWidget {
  const Homebody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  Text("News", style: CustomTextstyle.text24BoldBlue),
                  Text("App", style: CustomTextstyle.text24BoldOrange),
                  Spacer(),
                  Text(
                    "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                  ),
                ],
              ),
              SizedBox(height: 40),
              ListviewNewscard(),
            ],
          ),
        ),
      ],
    );
  }
}
