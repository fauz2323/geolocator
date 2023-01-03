import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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
      body: BlocBuilder<Maps_pagesCubit, Maps_pagesState>(
        builder: (context, state) => Container(
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(51.509364, -0.128928),
              zoom: 9.2,
            ),
            mapController: cubit.state.mapController,
          ),
        ),
      ),
    );
  }
}
