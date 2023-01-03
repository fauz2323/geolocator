import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:geolocator_fe/config/service/faskes_services.dart';
import 'package:geolocator_fe/data/model/category_model.dart';

import 'category_pages_state.dart';

class Category_pagesCubit extends Cubit<Category_pagesState> {
  Category_pagesCubit() : super(Category_pagesState().init());

  initial() async {
    final getDataCategory = await FaskesService.getCategory();
    print(getDataCategory.body);
    var jsonData = jsonDecode(getDataCategory.body);
    emit(
      state.clone()
        ..categoryModel = CategoryModel.fromJson(jsonData)
        ..isLoading = false,
    );
    print(state.isLoading);
  }

  increment() {
    emit(
      state.clone()..data = state.data + 1,
    );
  }
}
