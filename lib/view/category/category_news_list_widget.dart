import 'package:flutter/material.dart';
import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/core/model/SourcesResponse.dart';
import 'package:news_app/view/category/category_tabs_widget.dart';
import 'package:news_app/view/home/category_grad_view_widget.dart';

import '../../core/model/Source.dart';

class CategoryNewsList extends StatelessWidget {
  Category category;

  CategoryNewsList({required this.category});

  late List<Source> sources;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SourcesResponse>(
        future: ApiManager.getSources(category.categoryID),
        builder: (buildContext, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error loading data ${snapshot.error.toString()}'),
            );
          }
          if (snapshot.data?.status == 'error') {
            return Center(
              child: Text('Server error ${snapshot.data?.message}'),
            );
          }
          return CategoryTabsWidget(sources);
        },
      ),
    );
  }
}
