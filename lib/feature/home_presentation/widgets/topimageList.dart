import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/feature/home_presentation/widgets/top_image_news_todayscreen.dart';

class Topimagelist extends StatefulWidget {
  const Topimagelist({super.key});

  @override
  State<Topimagelist> createState() => _TopimagelistState();
}

class _TopimagelistState extends State<Topimagelist> {
  bool showOverlay = false;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 11,
      itemBuilder: (context, index, realIndex) => Topimagenews(
        image:
            'https://tse1.mm.bing.net/th/id/OIP.gY3UuNfnbu5r4XXjrNNP_wHaLH?rs=1&pid=ImgDetMain&o=7&rm=3',
      ),
      options: CarouselOptions(
        height: 280,
        aspectRatio: 16 / 9,
        viewportFraction: 0.68,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),

        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
