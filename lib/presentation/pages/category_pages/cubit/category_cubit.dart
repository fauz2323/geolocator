import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../config/service/faskes_services.dart';
import '../../../../data/model/category_model.dart';

part 'category_state.dart';
part 'category_cubit.freezed.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState.initial());

  initial() async {
    try {
      emit(CategoryState.loading());
      final getDataCategory = await FaskesService.getCategory();
      print(getDataCategory.body);
      var jsonData = jsonDecode(getDataCategory.body);
      emit(CategoryState.loaded(CategoryModel.fromJson(jsonData)));
    } on SocketException catch (_) {
      emit(CategoryState.error('error connection'));
    } catch (e) {
      emit(CategoryState.error('error connection'));
    }
  }
}
