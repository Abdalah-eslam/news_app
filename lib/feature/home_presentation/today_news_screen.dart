import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/core/TextStyle.dart';
import 'package:news_app/core/uitils/customAppBar.dart';
import 'package:news_app/feature/home_presentation/cubits/trending_cubit_cubit.dart';

import 'package:news_app/feature/home_presentation/widgets/topimageList.dart';
import 'package:news_app/feature/home_presentation/widgets/trending_news.dart';

class TodayNewsBody extends StatelessWidget {
  const TodayNewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingCubitCubit, TrendingCubitState>(
      builder: (context, state) {
        if (state is TrendingSuccess) {
          return CustomScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Row(
                      children: [
                        CustomAppbar(
                          title: "Today's",
                          subtitle: "News",
                          rightText: 'Today',
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SliverToBoxAdapter(
                child: Column(
                  children: [Topimagelist(newsmodel: state.newsModel)],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 40,
                  child: Text(
                    'Trending',
                    style: CustomTextstyle.text18BoldOrange,
                  ),
                ),
              ),
              TrendingNews(newsmodel: state.newsModel),
            ],
          );
        } else if (state is TrendingError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
