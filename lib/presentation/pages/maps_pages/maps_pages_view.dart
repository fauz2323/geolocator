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
        floatingActionButton:
            FloatingActionButton(onPressed: () => cubit.currentPossition()),
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
                    center: LatLng(51.509364, -0.128928),
                    zoom: 9.2,
                  ),
                  mapController: state.mapController,
                  children: state.coordinateModel.coordinate
                      .map(
                        (e) => MarkerLayer(
                          markers: [
                            Marker(
                              point: LatLng(double.parse(e.latitude),
                                  double.parse(e.longitude)),
                              width: 80,
                              height: 80,
                              builder: (context) => IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.location_on),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
              Container(
                width: width(context),
                height: height(context) * 10 / 100,
                decoration: BoxDecoration(
                  color: MyColors.grren001,
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
