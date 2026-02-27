part of 'trending_cubit_cubit.dart';

sealed class TrendingCubitState extends Equatable {
  const TrendingCubitState();

  @override
  List<Object> get props => [];
}

final class TrendingCubitInitial extends TrendingCubitState {}

final class TrendingLoading extends TrendingCubitState {}

final class TrendingSuccess extends TrendingCubitState {
  final NewsModel newsModel;
  const TrendingSuccess(this.newsModel);
}

final class TrendingError extends TrendingCubitState {
  final String message;
  const TrendingError(this.message);
}
