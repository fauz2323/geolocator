import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:geolocator_fe/config/service/faskes_services.dart';
import 'package:geolocator_fe/data/model/faskes_model.dart';

import '../../../data/model/faskes_category_model.dart';
import 'faskes_pages_state_id.dart';

class Faskes_pagesCubit_id extends Cubit<Faskes_pagesState_id> {
  Faskes_pagesCubit_id(this.id) : super(Faskes_Initial());

  final int id;

  initial() async {
    emit(Faskes_Loading());
    final dataFaskes = await FaskesService.getCategoryById(id);
    print(dataFaskes.body);
    var jsonData = jsonDecode(dataFaskes.body);

    emit(Faskes_FinishedLoading(
        faskesModel: FaskesCategoryModel.fromJson(jsonData)));
  }
}
