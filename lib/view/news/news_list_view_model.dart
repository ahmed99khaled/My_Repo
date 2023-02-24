import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/api_manager.dart';

import '../../core/model/News.dart';

class NewsListViewModel extends Cubit<NewsListState> {
  NewsListViewModel() : super(LoadingState());

  void loadNews(String sourceId) async {
    try {
      var response = await ApiManager.getNews(sourceId: sourceId);
      if (response.status == 'error') {
        emit(ErrorState(response.message!));
      } else {
        emit(LoadNewsState(response.articles!));
      }
    } catch (e) {
      emit(ErrorState('Something error to load sources'));
    }
  }
}

abstract class NewsListState {}

class LoadingState extends NewsListState {}

class ErrorState extends NewsListState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class LoadNewsState extends NewsListState {
  List<News> newsList;

  LoadNewsState(this.newsList);
}
