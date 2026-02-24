import 'package:flutter/material.dart';
import 'package:news_app/core/uitils/methodTimeofNewsago.dart';
import 'package:news_app/feature/data/newsModels/news.dart';
import 'package:news_app/feature/home_presentation/widgets/news_card.dart';

class ListviewNewscard extends StatelessWidget {
  const ListviewNewscard({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: NewsCard(
            urlparse: newsModel.articles?[index].url ?? "",
            title: newsModel.articles?[index].source?.name ?? '',
            author: newsModel.articles?[index].author ?? "",
            imageTourl: newsModel.articles?[index].urlToImage ?? "",
            description: newsModel.articles?[index].description ?? "",
            time: timeAgo(
              DateTime.parse(newsModel.articles?[index].publishedAt ?? ''),
            ),
          ),
        );
      },
    );
  }
}
