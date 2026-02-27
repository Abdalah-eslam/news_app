import 'package:flutter/material.dart';
import 'package:news_app/core/TextStyle.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.title,
    required this.author,
    required this.imageTourl,
    required this.description,
    required this.time,
    required this.urlparse,
  });
  final String title;
  final String author;
  final String imageTourl;
  final String description;
  final String time;
  final String urlparse;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Card(
        color: Colors.white,
        elevation: 2,

        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: () {
                    launchURL(context, urlparse);
                  },
                  title: Text(title, style: CustomTextstyle.text24BoldBlue),
                  subtitle: Text(author),
                  isThreeLine: true,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: 180,
                    child: Text(
                      description,

                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextstyle.text16Boldgray.copyWith(),
                    ),
                  ),
                ),
              ],
            ),

            Positioned(
              top: 8,
              right: 8,
              child: Hero(
                tag: imageTourl,
                child: Container(
                  margin: const EdgeInsets.only(right: 8, top: 8),
                  width: MediaQuery.of(context).size.height * 0.18,
                  height: MediaQuery.of(context).size.height * 0.19,

                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageTourl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Text(
                time,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void launchURL(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('can.t do it now , try letar')));
    }
  }
}
