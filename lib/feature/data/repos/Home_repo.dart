import 'package:dartz/dartz.dart';
import 'package:news_app/feature/data/newsModels/news.dart';

abstract class HomeRepo {
  Future<Either<String, NewsModel>> getTopHeadlines();
  Future<Either<String, NewsModel>> getnewestNews();
  Future<Either<String, NewsModel>> searchNews(String query);
}
