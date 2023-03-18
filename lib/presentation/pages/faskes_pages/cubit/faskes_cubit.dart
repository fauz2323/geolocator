import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../config/service/faskes_services.dart';
import '../../../../data/model/faskes_model.dart';

part 'faskes_state.dart';
part 'faskes_cubit.freezed.dart';

class FaskesCubit extends Cubit<FaskesState> {
  FaskesCubit() : super(FaskesState.initial());

  initial() async {
    emit(FaskesState.loading());
    final dataFaskes = await FaskesService.getFaskes();
    print(dataFaskes.body);
    var jsonData = jsonDecode(dataFaskes.body);

    emit(FaskesState.loaded(FaskesModel.fromJson(jsonData)));
  }
}
