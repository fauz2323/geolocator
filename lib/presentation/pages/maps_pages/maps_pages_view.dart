import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import 'maps_pages_cubit.dart';
import 'maps_pages_state.dart';

class Maps_pagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Maps_pagesCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<Maps_pagesCubit>(context);
    cubit.initial();
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () => cubit.currentPossition()),
      body: cubit.state.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: OSMFlutter(
                controller: cubit.state.controller,
                markerOption: MarkerOption(
                  defaultMarker: MarkerIcon(
                    icon: Icon(
                      Icons.control_point_sharp,
                    ),
                  ),
                ),
                userLocationMarker: UserLocationMaker(
                  personMarker: MarkerIcon(
                    icon: Icon(
                      Icons.person,
                    ),
                  ),
                  directionArrowMarker: MarkerIcon(
                    icon: Icon(
                      Icons.control_point_sharp,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
