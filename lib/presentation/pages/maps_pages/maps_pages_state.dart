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

  Maps_pagesState init() {
    print('mulai');
    return Maps_pagesState();
  }

  Maps_pagesState clone() {
    return Maps_pagesState();
  }
}
