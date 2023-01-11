import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator_fe/data/model/coordinate_model.dart';
import 'package:geolocator_fe/data/model/maps_alamat_model.dart';
import 'package:latlong2/latlong.dart';

// ignore: camel_case_types
class Maps_pagesState {}

class MapsStateInitial extends Maps_pagesState {}

class MapsStateLoading extends Maps_pagesState {}

class MapsStateFinishedLoading extends Maps_pagesState {
  MapsStateFinishedLoading(
      this.currentPossition, this.detailMaps, this.coordinateModel);

  final CoordinateModel coordinateModel;
  final LatLng currentPossition;
  MapController mapController = MapController();

  DetailMaps detailMaps = DetailMaps(
    namaFaskes: '',
    latitude: "",
    longitude: "",
  );
}

class MapsStateError extends Maps_pagesState {}
