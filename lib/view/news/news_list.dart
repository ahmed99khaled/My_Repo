import 'package:flutter/material.dart';
import 'package:news_app/core/model/Source.dart';
import 'package:news_app/view/base/base.dart';
import 'package:news_app/view/news/news_item.dart';
import 'package:news_app/view/news/news_list_view_model.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  Source source;

  NewsList(this.source);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends BaseView<NewsList, NewsListViewModel>
    implements NewsListNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.loadNews(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
        child:
            Consumer<NewsListViewModel>(builder: (buildContext, viewModel, __) {
          if (viewModel.errorMessage != null) {
            return Center(
              child: Column(
                children: [
                  Text(viewModel.errorMessage!),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.loadNews(widget.source.id!);
                      },
                      child: Text('Try Again')),
                ],
              ),
            );
          } else if (viewModel.newsList == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) =>
                  NewsItem(viewModel.newsList![index]),
              itemCount: viewModel.newsList!.length,
            );
          }
        }),

        // FutureBuilder<NewsResponse>(
        //   future: ApiManager.getNews(sourceId: source.id ?? ''),
        //   builder: (context, snapshot) {
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
        //     var articalesList = snapshot.data?.articles;
        //     return ListView.builder(
        //       itemBuilder: (context, index) => NewsItem(articalesList![index]),
        //       itemCount: snapshot.data?.articles?.length,
        //     );
        //   },
        // ),
      ),
    );
  }

  @override
  NewsListViewModel initViewModel() {
    return NewsListViewModel();
  }
}
