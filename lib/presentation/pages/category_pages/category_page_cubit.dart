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
    emit(CategoryPageLoading());
    final getDataCategory = await FaskesService.getCategory();
    print(getDataCategory.body);
    var jsonData = jsonDecode(getDataCategory.body);
    emit(CategoryFinishedLoading(CategoryModel.fromJson(jsonData)));
  }

  @override
  Future<void> close() {
    print("Cubit Closed");
    // TODO: implement close
    return super.close();
  }
}
