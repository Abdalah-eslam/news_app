import 'package:flutter/material.dart';
import 'package:news_app/core/uitils/customAppBar.dart';

class TodayNewsBody extends StatelessWidget {
  const TodayNewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  CustomAppbar(
                    title: "Today's",
                    subtitle: "News",
                    rightText: 'Today',
                  ),
                ],
              ),
            ],
          ),
        ),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Container(
                    width: 250,
                    height: 200,
                    color: Colors.white,
                    child: Center(child: Text('News Item ${index + 1}')),
                  ),
                );
              },
            ),
          ),
        ),
        SliverList.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Center(
              child: Text(
                'No more news for today.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          },
        ),
      ],
    );
  }
}
