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

    if (getCoordinate.statusCode == 200) {
      state.coordinateModel = CoordinateModel.fromJson(jsonData);
      for (var element in state.coordinateModel.coordinate) {
        emit(
          state
            ..marker.add(
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(
                  double.parse(element.latitude),
                  double.parse(element.longitude),
                ),
                builder: (ctx) => Container(
                    child: Column(
                  children: [
                    Text(element.namaFaskes),
                    IconButton(
                        onPressed: () {
                          print('alamat');
                          setAlamat(element.namaFaskes, element.namaFaskes);
                        },
                        icon: Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ))
                  ],
                )),
              ),
            ),
        );
      }
    }

    debugPrint(state.marker.first.point.latitude.toString() +
        " " +
        state.marker.first.point.longitude.toString());

    emit(
      state
        ..clone()
        ..currentPossition = LatLng(position.latitude, position.longitude)
        ..isLoading = false,
    );

    print(state.clone().isLoading);
  }

  currentPossition() async {
    emit(state.clone()
      ..isLoading = false
      ..alamatFaskes = 2.toString()
      ..namaFaskes = 2.toString());
  }

  setAlamat(String alamat, String nama) {
    emit(state.clone()
      ..alamatFaskes = alamat
      ..namaFaskes = nama);
  }

  @override
  Future<void> close() {
    // TODO: implement close
    state.mapController.dispose();
    debugPrint("close");
    return super.close();
  }
}
