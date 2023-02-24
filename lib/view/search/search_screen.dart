import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view/search/search_view_model.dart';

import '../news/news_item.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  SearchViewModel viewModel = SearchViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.loadNews(query);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'assets/images/pattern.png',
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 13,
            title: Container(
              height: 60,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                      color: Theme.of(context).primaryColor,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search_outlined),
                      color: Theme.of(context).primaryColor,
                    ),
                    hintText: 'Search Artical',
                    hintStyle:
                        TextStyle(color: Theme.of(context).primaryColor)),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
          ),
          body: BlocProvider(
            create: (context) => viewModel,
            child: Container(
              child: BlocBuilder<SearchViewModel, SearchState>(
                bloc: viewModel,
                builder: (context, state) {
                  if (state is LoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ErrorState) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.errorMessage),
                          ElevatedButton(
                              onPressed: () {
                                viewModel.loadNews(query);
                              },
                              child: Text('Try Again')),
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
              //   future: ApiManager.getNews(query: query),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }
              //     if (snapshot.hasError) {
              //       return Center(
              //         child:
              //             Text('Error loading data ${snapshot.error.toString()}'),
              //       );
              //     }
              //     if (snapshot.data?.status == 'error') {
              //       return Center(
              //         child: Text('Server error ${snapshot.data?.message}'),
              //       );
              //     }
              //     var articalesList = snapshot.data?.articles;
              //     return ListView.builder(
              //       itemBuilder: (context, index) =>
              //           NewsItem(articalesList![index]),
              //       itemCount: snapshot.data?.articles?.length,
              //     );
              //   },
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
