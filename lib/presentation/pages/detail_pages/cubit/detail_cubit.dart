import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator_fe/config/service/faskes_services.dart';

import '../../../../data/model/detaul_faskes_model.dart';

part 'detail_state.dart';
part 'detail_cubit.freezed.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailState.initial());

  initial(var id) async {
    emit(DetailState.loading());
    try {
      final data = await FaskesService.getFaskesbyId(id);
      if (data.statusCode == 200) {
        var jsonData = jsonDecode(data.body);
        emit(DetailState.loaded(FaskesDetailModel.fromJson(jsonData)));
      } else if (data.statusCode == 404) {
        emit(DetailState.error("Data tidak ditemukan"));
      } else {
        emit(DetailState.error("Terjadi kesalahan"));
      }
    } catch (e) {
      emit(DetailState.error(e.toString()));
    }
  }
}
