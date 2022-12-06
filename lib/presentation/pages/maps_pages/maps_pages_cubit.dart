import 'package:bloc/bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import 'maps_pages_state.dart';

class Maps_pagesCubit extends Cubit<Maps_pagesState> {
  Maps_pagesCubit() : super(Maps_pagesState().init());

  initial() async {
    emit(
      state.clone()
        ..controller = MapController(
          initMapWithUserPosition: false,
          initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
        )
        ..isLoading = false,
    );
  }

  currentPossition() async {
    await state.controller.currentLocation();
    await state.controller
        .addMarker(GeoPoint(latitude: 47.4358055, longitude: 8.4737324));
  }
}
