import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/uitils/customAppBar.dart';
import 'package:news_app/core/uitils/methodTimeofNewsago.dart';
import 'package:news_app/core/uitils/router_app.dart';
import 'package:news_app/feature/data/newsModels/news.dart';
import 'package:news_app/feature/home_presentation/cubits/searchCubit/search_cubit.dart';
import 'package:news_app/feature/home_presentation/widgets/news_card.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: Column(
                children: [
                  CustomAppbar(
                    title: 'Search',
                    subtitle: 'News',
                    rightText: '',
                  ),
                  SizedBox(height: 20),
                  TextField(
                    onSubmitted: (value) {
                      BlocProvider.of<SearchCubit>(context).searchNews(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Search',
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoaded) {
                return SliverFillRemaining(
                  child: ListView.builder(
                    itemCount: state.newsModel.articles?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () => RouterApp.router.push(
                          '/detailsNews',
                          extra: state.newsModel.articles?[index],
                        ),
                        child: NewsCard(
                          urlparse: state.newsModel.articles?[index].url ?? "",
                          title:
                              state.newsModel.articles?[index].source?.name ??
                              '',
                          author: state.newsModel.articles?[index].author ?? "",
                          imageTourl:
                              state.newsModel.articles?[index].urlToImage ?? "",
                          description:
                              state.newsModel.articles?[index].description ??
                              "",
                          time: timeAgo(
                            DateTime.parse(
                              state.newsModel.articles?[index].publishedAt ??
                                  '',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is SearchError) {
                return SliverFillRemaining(
                  child: Center(child: Text(state.message)),
                );
              } else if (state is SearchLoading) {
                return SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                return SliverFillRemaining(
                  child: Center(child: Text('please enter something')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
