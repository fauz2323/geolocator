import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:geolocator_fe/config/service/faskes_services.dart';
import 'package:geolocator_fe/data/model/faskes_model.dart';

import 'faskes_pages_state.dart';

class Faskes_pagesCubit extends Cubit<Faskes_pagesState> {
  Faskes_pagesCubit() : super(Faskes_Initial());

  initial() async {
    emit(Faskes_Loading());
    final dataFaskes = await FaskesService.getFaskes();
    print(dataFaskes.body);
    var jsonData = jsonDecode(dataFaskes.body);

    emit(Faskes_FinishedLoading(faskesModel: FaskesModel.fromJson(jsonData)));
  }
}
