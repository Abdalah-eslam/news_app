import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

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
            ListTile(
              title: Text('News Title'),
              subtitle: Text('News description goes here.'),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                margin: const EdgeInsets.only(right: 16, top: 8),
                width: MediaQuery.of(context).size.height * 0.14,
                height: MediaQuery.of(context).size.height * 0.14,

                decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://tse2.mm.bing.net/th/id/OIF.BHzP6mcnG812lOL9Wow7zw?rs=1&pid=ImgDetMain&o=7&rm=3',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Text(
                '2 hours ago',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Icon(Icons.bookmark_border, size: 24, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
