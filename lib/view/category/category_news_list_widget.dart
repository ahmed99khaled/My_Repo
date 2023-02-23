import 'package:flutter/material.dart';
import 'package:news_app/view/base/base.dart';
import 'package:news_app/view/category/category_tabs_widget.dart';
import 'package:news_app/view/category/category_view_model.dart';
import 'package:news_app/view/home/category_grad_view_widget.dart';
import 'package:provider/provider.dart';

class CategoryNewsList extends StatefulWidget {
  Category category;

  CategoryNewsList({required this.category});

  @override
  State<CategoryNewsList> createState() => _CategoryNewsListState();
}

class _CategoryNewsListState
    extends BaseView<CategoryNewsList, CategoryNewsViewModel>
    implements CategoryNewsNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.loadSources(widget.category.categoryID);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
        child: Consumer<CategoryNewsViewModel>(
          builder: (buildContext, viewModel, __) {
            if (viewModel.errorMessage != null) {
              return Center(
                child: Column(
                  children: [
                    Text(viewModel.errorMessage!),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.loadSources(widget.category.categoryID);
                        },
                        child: Text('Try Again')),
                  ],
                ),
              );
            } else if (viewModel.sources == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return CategoryTabsWidget(viewModel.sources!);
            }
          },
        ),
      ),
    );
  }

  @override
  CategoryNewsViewModel initViewModel() {
    return CategoryNewsViewModel();
  }
}
