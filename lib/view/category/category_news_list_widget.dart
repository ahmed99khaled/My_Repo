import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view/category/category_tabs_widget.dart';
import 'package:news_app/view/category/category_view_model.dart';
import 'package:news_app/view/home/category_grad_view_widget.dart';

class CategoryNewsList extends StatefulWidget {
  Category category;

  CategoryNewsList({required this.category});

  @override
  State<CategoryNewsList> createState() => _CategoryNewsListState();
}

class _CategoryNewsListState extends State<CategoryNewsList> {
  CategoryViewModel viewModel = CategoryViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.loadSources(widget.category.categoryID);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Container(
        child: BlocBuilder<CategoryViewModel, CategoryState>(
          bloc: viewModel,
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadSourcesState) {
              return CategoryTabsWidget(state.sources);
            } else if (state is ErrorState) {
              return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(onPressed: () {}, child: Text('Try Again')),
                  ],
                ),
              );
            }
            return Container();
          },
        ),

        // FutureBuilder<SourcesResponse>(
        //   future: ApiManager.getSources(category.categoryID),
        //   builder: (buildContext, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //     if (snapshot.hasError) {
        //       return Center(
        //         child: Text('Error loading data ${snapshot.error.toString()}'),
        //       );
        //     }
        //     if (snapshot.data?.status == 'error') {
        //       return Center(
        //         child: Text('Server error ${snapshot.data?.message}'),
        //       );
        //     }
        //     return CategoryTabsWidget(snapshot.data!.sources!);
        //   },
        // ),
      ),
    );
  }
}
