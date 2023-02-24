import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api/api_manager.dart';
import '../../core/model/Source.dart';

class CategoryViewModel extends Cubit<CategoryState> {
  CategoryViewModel() : super(LoadingState());

  void loadSources(String categoryId) async {
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response.status == 'error') {
        emit(ErrorState(response.message!));
      } else {
        emit(LoadSourcesState(response.sources!));
      }
    } catch (e) {
      emit(ErrorState('Something error to load sources'));
    }
  }
}

abstract class CategoryState {}

class LoadingState extends CategoryState {}

class ErrorState extends CategoryState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class LoadSourcesState extends CategoryState {
  List<Source> sources;

  LoadSourcesState(this.sources);
}
