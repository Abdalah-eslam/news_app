import 'package:flutter/material.dart';
import 'package:news_app/feature/home/widgets/news_card.dart';

class ListviewNewscard extends StatelessWidget {
  const ListviewNewscard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const NewsCard();
      },
    );
  }
}
