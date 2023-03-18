import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator_fe/config/config.dart';
import 'package:geolocator_fe/presentation/pages/maps_pages/cubit/maps_cubit.dart';
import 'package:latlong2/latlong.dart';

class Maps_pagesPage extends StatelessWidget {
  const Maps_pagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MapsCubit()..initial(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<MapsCubit>(context, listen: false);
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
                cubit.currentPossitionSet();
              },
              icon: Icon(Icons.location_searching),
            ),
          ],
        ),
        body: BlocBuilder<MapsCubit, MapsState>(builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (coordinateModel, currentPossition, mapController,
                    detailMaps) =>
                Column(children: [
              Expanded(
                child: FlutterMap(
                  options: MapOptions(
                    center: currentPossition,
                    zoom: 14.2,
                  ),
                  mapController: mapController,
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    ),
                    MarkerLayer(markers: [
                      Marker(
                        point: LatLng(
                          currentPossition.latitude,
                          currentPossition.longitude,
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
                      markers: coordinateModel.coordinate
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
                          detailMaps.namaFaskes,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Latitude"),
                        Text(detailMaps.latitude),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Longitude"),
                        Text(detailMaps.longitude),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    detailMaps.latitude != ""
                        ? SizedBox(
                            width: width(context) * 90 / 100,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.mainColor,
                              ),
                              onPressed: () {
                                cubit.openMaps(
                                    detailMaps.latitude, detailMaps.longitude);
                              },
                              child: Text("Open Maps"),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ]),
            error: (error) => Center(
              child: Text(error),
            ),
          );
        }),
      ),
    );
  }
}
