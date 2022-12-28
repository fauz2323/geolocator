import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:geolocator/config/service/faskes_services.dart';
import 'package:geolocator/data/model/faskes_model.dart';

import 'faskes_pages_state.dart';

class Faskes_pagesCubit extends Cubit<Faskes_pagesState> {
  Faskes_pagesCubit() : super(Faskes_pagesState().init());

  initial() async {
    final dataFaskes = await FaskesService.getFaskes();
    print(dataFaskes.body);
    var jsonData = jsonDecode(dataFaskes.body);

    emit(
      state.clone()
        ..faskesModel = FaskesModel.fromJson(jsonData)
        ..isLoading = false,
    );
  }
}
