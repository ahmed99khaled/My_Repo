import 'package:flutter/material.dart';
import 'package:news_app/core/model/Source.dart';
import 'package:news_app/view/news/news_item.dart';

import '../../core/api/api_manager.dart';
import '../../core/model/NewsResponse.dart';

class NewsList extends StatelessWidget {
  Source source;

  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(sourceId: source.id ?? ''),
        builder: (context, snapshot) {
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
          var articalesList = snapshot.data?.articles;
          return ListView.builder(
            itemBuilder: (context, index) => NewsItem(articalesList![index]),
            itemCount: snapshot.data?.articles?.length,
          );
        },
      ),
    );
  }
}
