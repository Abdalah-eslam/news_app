import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/data/newsModels/news.dart';
import 'package:news_app/feature/data/repos/home_repo_impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final HomeRepoImpl homeRepoImpl;
  SearchCubit({required this.homeRepoImpl}) : super(SearchInitial());

  void searchNews(String query) async {
    emit(SearchLoading());
    var result = await homeRepoImpl.searchNews(query);
    result.fold(
      (l) => emit(SearchError(message: l)),
      (r) => emit(SearchLoaded(newsModel: r)),
    );
  }
}
