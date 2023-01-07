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
      create: (BuildContext context) => Maps_pagesCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<Maps_pagesCubit>(context, listen: false);
    cubit.initial();
    return SafeArea(
      child: Scaffold(
        floatingActionButton:
            FloatingActionButton(onPressed: () => cubit.currentPossition()),
        body: BlocBuilder<Maps_pagesCubit, Maps_pagesState>(
          builder: (context, state) => SizedBox(
            width: width(context),
            height: height(context) * 10 / 100,
            child: Column(
              children: [
                Text("Nama Faskes : "),
                Text(state.alamatFaskes),
                Text("Alamat Faskes : "),
                Text(state.alamatFaskes),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
