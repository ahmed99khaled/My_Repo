import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api/api_manager.dart';
import '../../core/model/News.dart';

class SearchViewModel extends Cubit<SearchState> {
  SearchViewModel() : super(LoadingState());

  void loadNews(String query) async {
    try {
      var response = await ApiManager.getNews(query: query);
      if (response.status == 'error') {
        emit(ErrorState('Sorry,No News,Search Now'));
      } else {
        emit(LoadNewsState(response.articles!));
      }
    } catch (e) {
      emit(ErrorState('Something error to load sources'));
    }
  }
}

abstract class SearchState {}

class LoadingState extends SearchState {}

class ErrorState extends SearchState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class LoadNewsState extends SearchState {
  List<News> newsList;

  LoadNewsState(this.newsList);
}
