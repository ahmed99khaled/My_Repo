import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/view/base/base.dart';

import '../../core/model/News.dart';

abstract class SearchNavigator extends BaseNavigator {}

class SearchViewModel extends BaseViewModel<SearchNavigator> {
  List<News>? news;
  String? errorMessage;

  void loadNews(String query) async {
    news = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNews(query: query);
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        news = response.articles;
      }
    } catch (e) {
      errorMessage = 'error getting news ';
    }
    notifyListeners();
  }
}
