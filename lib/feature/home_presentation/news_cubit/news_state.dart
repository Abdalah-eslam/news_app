part of 'news_cubit.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  final NewsModel newsModel;
  const NewsSuccess(this.newsModel);
}

final class NewsError extends NewsState {
  final String message;
  const NewsError(this.message);
}
