import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:news_app/feature/data/newsModels/news.dart';

class TrendingNews extends StatelessWidget {
  final NewsModel newsmodel;
  const TrendingNews({super.key, required this.newsmodel});

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid.count(
      crossAxisSpacing: 6,
      mainAxisSpacing: 13,
      childCount: 20,
      crossAxisCount: 2,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  newsmodel.articles?[index].urlToImage ?? "",
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(height: 150, color: Colors.grey[300]);
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 150,
                      color: Colors.grey,
                      child: Icon(Icons.broken_image),
                    );
                  },
                ),
              ),
              SizedBox(height: 7),
              ListTile(
                title: Text(newsmodel.articles?[index].title ?? ""),
                subtitle: Text(
                  newsmodel.articles?[index].description ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                isThreeLine: true,
              ),
            ],
          ),
        );
      },
    );
  }
}
