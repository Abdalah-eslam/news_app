import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:news_app/core/TextStyle.dart';
import 'package:news_app/core/uitils/customAppBar.dart';
import 'package:news_app/feature/home_presentation/widgets/news_card.dart';
import 'package:news_app/feature/home_presentation/widgets/topimageList.dart';

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

        SliverToBoxAdapter(child: Column(children: [Topimagelist()])),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 40,
            child: Text('Trending', style: CustomTextstyle.text18BoldOrange),
          ),
        ),
        SliverMasonryGrid.count(
          childCount: 10,
          crossAxisCount: 2,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://images.pexels.com/photos/1526713/pexels-photo-1526713.jpeg?cs=srgb&dl=pexels-francesco-ungaro-1526713.jpg&fm=jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 7),
                  ListTile(
                    title: Text('Lorem ipsum  '),
                    subtitle: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    isThreeLine: true,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
