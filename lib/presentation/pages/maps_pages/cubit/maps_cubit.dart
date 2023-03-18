import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_fe/data/model/maps_alamat_model.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps_launcher/maps_launcher.dart';

import '../../../../config/service/maps_services.dart';
import '../../../../data/model/coordinate_model.dart';

part 'maps_state.dart';
part 'maps_cubit.freezed.dart';

class MapsCubit extends Cubit<MapsState> {
  MapsCubit() : super(MapsState.initial());
  final MapController mapController = MapController();
  late CoordinateModel coordinateModel;
  late LatLng currentPossition;

  initial() async {
    emit(MapsState.loading());
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var getCoordinate = await MapsService.getData();
    var jsonData = jsonDecode(getCoordinate.body);

    if (getCoordinate.statusCode == 200) {
      coordinateModel = CoordinateModel.fromJson(jsonData);
      currentPossition = LatLng(position.latitude, position.longitude);
      emit(
        MapsState.loaded(
          coordinateModel,
          currentPossition,
          mapController,
          DetailMaps(latitude: '', longitude: '', namaFaskes: ''),
        ),
      );
    }
  }

  currentPossitionSet() async {
    emit(MapsState.loading());
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPossition = LatLng(position.latitude, position.longitude);
    emit(
      MapsState.loaded(
        coordinateModel,
        currentPossition,
        mapController,
        DetailMaps(latitude: '', longitude: '', namaFaskes: ''),
      ),
    );
  }

  setAlamat(String namaFaskes, String latitude, String longitude) async {
    emit(
      MapsState.loaded(
        coordinateModel,
        currentPossition,
        mapController,
        DetailMaps(
          latitude: latitude,
          longitude: longitude,
          namaFaskes: namaFaskes,
        ),
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
    return super.close();
  }
}
