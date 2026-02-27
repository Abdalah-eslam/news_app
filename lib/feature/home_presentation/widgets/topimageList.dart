import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/uitils/router_app.dart';
import 'package:news_app/feature/data/newsModels/news.dart';
import 'package:news_app/feature/home_presentation/widgets/top_image_news_todayscreen.dart';

class Topimagelist extends StatefulWidget {
  final NewsModel newsmodel;

  const Topimagelist({super.key, required this.newsmodel});

  @override
  State<Topimagelist> createState() => _TopimagelistState();
}

class _TopimagelistState extends State<Topimagelist> {
  bool showOverlay = false;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (context, index, realIndex) => InkWell(
        onTap: () => RouterApp.router.push(
          '/detailsNews',
          extra: widget.newsmodel.articles?[index],
        ),
        child: Topimagenews(
          author: widget.newsmodel.articles?[index].author ?? "",
          image: widget.newsmodel.articles?[index].urlToImage ?? "",
          titile: widget.newsmodel.articles?[index].title ?? "",
        ),
      ),
      options: CarouselOptions(
        height: 280,
        aspectRatio: 16 / 9,
        viewportFraction: 0.68,
        initialPage: 0,
        enableInfiniteScroll: true,

        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),

        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
