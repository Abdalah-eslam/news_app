import 'package:dartz/dartz.dart';
import 'package:news_app/feature/data/newsModels/news.dart';

abstract class HomeRepo {
  Future<Either<String, NewsModel>> getTopHeadlines();
  Future<Either<String, NewsModel>> getTendingNews(String query);
  Future<Either<String, NewsModel>> searchNews(String query);
}
