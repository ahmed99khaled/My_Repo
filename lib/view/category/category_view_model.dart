import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/view/base/base.dart';

import '../../core/model/Source.dart';

abstract class CategoryNewsNavigator extends BaseNavigator {}

class CategoryNewsViewModel extends BaseViewModel<CategoryNewsNavigator> {
  List<Source>? sources = [];
  String? errorMessage;

  void loadSources(String categoryId) async {
    sources = null;
    errorMessage = null;
    notifyListeners();

    try {
      var response = await ApiManager.getSources(categoryId);
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        sources = response.sources;
      }
    } catch (e) {
      //navigator?.showMessage('error getting news source');
      errorMessage = 'error getting news source';
    }
    notifyListeners();
  }
}
