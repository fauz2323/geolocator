import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_fe/config/service/maps_services.dart';
import 'package:geolocator_fe/data/model/maps_alamat_model.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps_launcher/maps_launcher.dart';

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
          DetailMaps(latitude: '', longitude: '', namaFaskes: ''),
          CoordinateModel.fromJson(jsonData),
        ),
      );
    }
  }

  currentPossition() async {
    var curentState = state as MapsStateFinishedLoading;
    emit(MapsStateLoading());
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    emit(
      MapsStateFinishedLoading(
        LatLng(position.latitude, position.longitude),
        DetailMaps(latitude: '', longitude: '', namaFaskes: ''),
        curentState.coordinateModel,
      ),
    );
  }

  setAlamat(String namaFaskes, String latitude, String longitude) async {
    var curentState = state as MapsStateFinishedLoading;
    emit(
      MapsStateFinishedLoading(
        curentState.currentPossition,
        DetailMaps(
          latitude: latitude,
          longitude: longitude,
          namaFaskes: namaFaskes,
        ),
        curentState.coordinateModel,
      ),
    );
  }

  openMaps(String lat, String lng) async {
    String googleMapslocationUrl =
        "https://www.google.com/maps/search/?api=1&query=$lat,$lng";

    Uri encodedURl = Uri.parse(googleMapslocationUrl);
    print(encodedURl);

    MapsLauncher.launchCoordinates(double.parse(lat), double.parse(lng));
  }

  @override
  Future<void> close() {
    // TODO: implement close
    debugPrint("close");
    return super.close();
  }
}
