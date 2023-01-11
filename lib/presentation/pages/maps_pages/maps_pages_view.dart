import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator_fe/config/config.dart';
import 'package:latlong2/latlong.dart';

import 'maps_pages_cubit.dart';
import 'maps_pages_state.dart';

class Maps_pagesPage extends StatelessWidget {
  const Maps_pagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Maps_pagesCubit()..initial(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<Maps_pagesCubit>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Maps"),
          actions: [
            IconButton(
              onPressed: () {
                cubit.initial();
              },
              icon: Icon(Icons.refresh),
            ),
            IconButton(
              onPressed: () {
                cubit.currentPossition();
              },
              icon: Icon(Icons.location_searching),
            ),
          ],
        ),
        body: BlocBuilder<Maps_pagesCubit, Maps_pagesState>(
            builder: (context, state) {
          if (state is MapsStateLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MapsStateFinishedLoading) {
            return Column(children: [
              Expanded(
                child: FlutterMap(
                  options: MapOptions(
                    center: state.currentPossition,
                    zoom: 14.2,
                  ),
                  mapController: state.mapController,
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    ),
                    MarkerLayer(markers: [
                      Marker(
                        point: LatLng(
                          state.currentPossition.latitude,
                          state.currentPossition.longitude,
                        ),
                        builder: (context) {
                          return Icon(
                            Icons.location_on,
                            color: Colors.blue,
                          );
                        },
                      ),
                    ]),
                    MarkerLayer(
                      markers: state.coordinateModel.coordinate
                          .map(
                            (e) => Marker(
                              point: LatLng(
                                double.parse(e.latitude),
                                double.parse(e.longitude),
                              ),
                              builder: (context) {
                                return IconButton(
                                  onPressed: () {
                                    cubit.setAlamat(
                                        e.namaFaskes, e.latitude, e.longitude);
                                  },
                                  icon: Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                  ),
                                );
                              },
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 10, right: 30, left: 30, bottom: 15),
                width: width(context),
                height: height(context) * 20 / 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      "Detail Faskes",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Nama Faskes"),
                        Text(
                          state.detailMaps.namaFaskes,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Latitude"),
                        Text(state.detailMaps.latitude),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Longitude"),
                        Text(state.detailMaps.longitude),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    state.detailMaps.latitude != ""
                        ? SizedBox(
                            width: width(context) * 90 / 100,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.mainColor,
                              ),
                              onPressed: () {
                                cubit.openMaps(state.detailMaps.latitude,
                                    state.detailMaps.longitude);
                              },
                              child: Text("Open Maps"),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ]);
          } else {
            return Center(
              child: Text("Error"),
            );
          }
        }),
      ),
    );
  }
}
