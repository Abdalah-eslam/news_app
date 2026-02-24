import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/feature/data/newsModels/news.dart';
import 'package:news_app/feature/data/repos/home_reop_impl.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  HomeRepoImpl homeRepoImpl;

  NewsCubit(this.homeRepoImpl) : super(NewsInitial());

  void fetchNews() async {
    emit(NewsLoading());

    var result = await homeRepoImpl.getTopHeadlines();

    result.fold((l) => emit(NewsError(l)), (r) => emit(NewsSuccess(r)));
  }

  @override
  void onChange(Change<NewsState> change) {
    super.onChange(change);
    log(change.toString());
  }
}
