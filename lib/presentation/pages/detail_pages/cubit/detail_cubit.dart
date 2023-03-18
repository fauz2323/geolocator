import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maps_launcher/maps_launcher.dart';

import '../../../../config/service/faskes_services.dart';
import '../../../../data/model/detail_model.dart';

part 'detail_state.dart';
part 'detail_cubit.freezed.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailState.initial());

  initial(var id) async {
    emit(DetailState.loading());
    var response = await FaskesService.getFaskesById(id);
    print(response.body);
    var jsonData = jsonDecode(response.body);
    MapController mapController = MapController();
    emit(DetailState.loaded(
        DetailFaskesModel.fromJson(jsonData), mapController));
  }

  openMaps(String lat, String lng) async {
    String googleMapslocationUrl =
        "https://www.google.com/maps/search/?api=1&query=$lat,$lng";

    Uri encodedURl = Uri.parse(googleMapslocationUrl);
    print(encodedURl);

    MapsLauncher.launchCoordinates(double.parse(lat), double.parse(lng));
  }
}
