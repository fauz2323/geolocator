import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../config/service/faskes_services.dart';
import '../../../../data/model/faskes_category_model.dart';

part 'faskes_id_state.dart';
part 'faskes_id_cubit.freezed.dart';

class FaskesIdCubit extends Cubit<FaskesIdState> {
  FaskesIdCubit() : super(FaskesIdState.initial());

  initial(var id) async {
    emit(FaskesIdState.loading());
    print(id);
    final dataFaskes = await FaskesService.getCategoryById(id);
    print(dataFaskes.body);
    var jsonData = jsonDecode(dataFaskes.body);

    emit(FaskesIdState.loaded(FaskesCategoryModel.fromJson(jsonData)));
  }
}
