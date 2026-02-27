import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/data/newsModels/news.dart';
import 'package:news_app/feature/data/repos/home_repo_impl.dart';

part 'trending_cubit_state.dart';

class TrendingCubitCubit extends Cubit<TrendingCubitState> {
  final HomeRepoImpl homeRepoImpl;
  TrendingCubitCubit({required this.homeRepoImpl})
    : super(TrendingCubitInitial());

  void fetchTrending() async {
    emit(TrendingLoading());

    var result = await homeRepoImpl.getTendingNews('Trending');

    result.fold((l) => emit(TrendingError(l)), (r) => emit(TrendingSuccess(r)));
  }

  @override
  void onChange(Change<TrendingCubitState> change) {
    super.onChange(change);
    log(change.toString());
  }
}
