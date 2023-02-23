import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/view/base/base.dart';

import '../../core/model/News.dart';

abstract class NewsListNavigator extends BaseNavigator {}

class NewsListViewModel extends BaseViewModel<NewsListNavigator> {
  List<News>? newsList = [];
  String? errorMessage;

  void loadNews(String sourceId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNews(sourceId: sourceId);
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        newsList = response.articles;
      }
    } catch (e) {
      errorMessage = 'error getting news ';
      //navigator?.showMessage('error getting news ');
    }
    notifyListeners();
  }
}
