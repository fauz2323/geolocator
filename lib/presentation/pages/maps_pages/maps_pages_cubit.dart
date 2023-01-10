import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_fe/config/service/maps_services.dart';
import 'package:latlong2/latlong.dart';

import '../../../data/model/coordinate_model.dart';
import 'maps_pages_state.dart';

class Maps_pagesCubit extends Cubit<Maps_pagesState> {
  Maps_pagesCubit() : super(MapsStateLoading());

  initial() async {
    emit(MapsStateLoading());
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var getCoordinate = await MapsService.getData();
    var jsonData = jsonDecode(getCoordinate.body);

    if (getCoordinate.statusCode == 200) {
      emit(
        MapsStateFinishedLoading(
          LatLng(position.latitude, position.longitude),
          '',
          '',
          CoordinateModel.fromJson(jsonData),
        ),
      );
    }
  }

  currentPossition() async {}

  setAlamat(String alamat, String nama) {}

  @override
  Future<void> close() {
    // TODO: implement close
    debugPrint("close");
    return super.close();
  }
}
