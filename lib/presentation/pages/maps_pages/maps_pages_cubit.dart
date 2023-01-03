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
  Maps_pagesCubit() : super(Maps_pagesState().init());

  initial() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var getCoordinate = await MapsService.getData();
    var jsonData = jsonDecode(getCoordinate.body);
    print([position.latitude, position.longitude, getCoordinate.body]);

    emit(
      state.clone()
        ..coordinateModel = CoordinateModel.fromJson(jsonData)
        ..currentPossition = LatLng(position.latitude, position.longitude)
        ..isLoading = false,
    );

    print("object");
    // for (var element in state.coordinateModel.coordinate) {
    //   emit(
    //     state.clone()
    //       ..marker.add(
    //         Marker(
    //           point: LatLng(
    //             double.parse(element.latitude),
    //             double.parse(element.longitude),
    //           ),
    //           builder: (context) => Container(
    //             child: IconButton(
    //               onPressed: () {
    //                 print(element.namaFaskes);
    //               },
    //               icon: Icon(Icons.location_on),
    //               color: Colors.red,
    //             ),
    //           ),
    //         ),
    //       ),
    //   );
    // }
  }

  currentPossition() async {}
}
