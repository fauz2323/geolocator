import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/service/faskes_services.dart';
import '../../../../data/model/category_model.dart';

part 'category_page_state.dart';

class CategoryPageCubit extends Cubit<CategoryPageState> {
  int counter = 0;
  String? namaCategory;
  CategoryPageCubit() : super(CategoryPageInitial());

  initial() async {
    try {
      emit(CategoryPageLoading());
      final getDataCategory = await FaskesService.getCategory();
      print(getDataCategory.body);
      var jsonData = jsonDecode(getDataCategory.body);
      emit(CategoryFinishedLoading(CategoryModel.fromJson(jsonData), 0, ''));
    } on SocketException catch (_) {
      emit(CategoryPageError());
    } catch (e) {
      emit(CategoryPageError());
    }
  }

  increment(String category) {
    //mau update si number
    //number++
    // emit(CategoryPageLoading());
    var data = state as CategoryFinishedLoading;
    emit(CategoryFinishedLoading(data.categoryModel, 33, category));
  }

  @override
  Future<void> close() {
    print("Cubit Closed");
    // TODO: implement close
    return super.close();
  }
}
