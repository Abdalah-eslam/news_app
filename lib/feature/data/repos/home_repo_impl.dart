import 'package:dartz/dartz.dart';
import 'package:news_app/core/apiservice.dart';
import 'package:news_app/feature/data/newsModels/news.dart';
import 'package:news_app/feature/data/repos/Home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final Apiservice apiservice;

  HomeRepoImpl({required this.apiservice});
  @override
  Future<Either<String, NewsModel>> getTopHeadlines() async {
    try {
      var response = await apiservice.getTopHeadlines();

      if (response.statusCode == 200) {
        final newsModel = NewsModel.fromMap(response.data);
        return Right(newsModel);
      } else {
        return Left('Failed to fetch top headlines');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, NewsModel>> getTendingNews(String query) async {
    try {
      final response = await apiservice.getnewestNews(query);
      if (response.statusCode == 200) {
        final newsModel = NewsModel.fromMap(response.data);
        return Right(newsModel);
      } else {
        return Left('Failed to fetch newest news');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, NewsModel>> searchNews(String query) async {
    try {
      final response = await apiservice.searchNews(query);
      if (response.statusCode == 200) {
        final newsModel = NewsModel.fromMap(response.data);
        return Right(newsModel);
      } else {
        return Left('Failed to search news');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
}
