import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/uitils/customAppBar.dart';

import 'package:news_app/feature/home_presentation/cubits/news_cubit.dart';
import 'package:news_app/feature/home_presentation/widgets/listview_newsCard.dart';

class Homebody extends StatefulWidget {
  const Homebody({super.key});

  @override
  State<Homebody> createState() => _HomebodyState();
}

class _HomebodyState extends State<Homebody> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsSuccess) {
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
                          title: "News",
                          subtitle: "App",
                          rightText: '',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    ListviewNewscard(newsModel: state.newsModel),
                  ],
                ),
              ),
            ],
          );
        } else if (state is NewsError) {
          return Center(child: Text('Error loading news'));
        }
        return Container();
      },
    );
  }
}
