import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator_fe/data/model/coordinate_model.dart';
import 'package:latlong2/latlong.dart';

// ignore: camel_case_types
class Maps_pagesState {
  bool isLoading = true;
  late CoordinateModel coordinateModel;
  late LatLng currentPossition;
  List<Marker> marker = [];
  MapController mapController = MapController();
  int number = 1;
  String namaFaskes = "";
  String alamatFaskes = "";

  Maps_pagesState init() {
    return Maps_pagesState();
  }

  Maps_pagesState clone() {
    return Maps_pagesState();
  }
}

class MapsStateInitial extends Maps_pagesState {}

class MapsStateLoading extends Maps_pagesState {}

class MapsStateFinishedLoading extends Maps_pagesState {
  MapsStateFinishedLoading() {
    isLoading = false;
  }
}

class MapsStateError extends Maps_pagesState {}
