import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/model/Source.dart';
import 'package:news_app/view/news/news_item.dart';
import 'package:news_app/view/news/news_list_view_model.dart';

class NewsList extends StatefulWidget {
  Source source;

  NewsList(this.source);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  NewsListViewModel viewModel = NewsListViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.loadNews(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Container(
        child: BlocBuilder<NewsListViewModel, NewsListState>(
          bloc: viewModel,
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorState) {
              return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(onPressed: () {}, child: Text('Try Again')),
                  ],
                ),
              );
            } else if (state is LoadNewsState) {
              return ListView.builder(
                itemBuilder: (context, index) =>
                    NewsItem(state.newsList[index]),
                itemCount: state.newsList.length,
              );
            }
            return Container();
          },
        ),

        // FutureBuilder<NewsResponse>(
        //   future: ApiManager.getNews(sourceId: widget.source.id ?? ''),
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
}
