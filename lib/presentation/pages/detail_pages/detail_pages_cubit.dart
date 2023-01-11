import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:geolocator_fe/config/service/faskes_services.dart';
import 'package:geolocator_fe/data/model/detail_model.dart';
import 'package:maps_launcher/maps_launcher.dart';

import 'detail_pages_state.dart';

class Detail_pagesCubit extends Cubit<Detail_pagesState> {
  Detail_pagesCubit(this.id) : super(InitialDetail_pagesState());

  final int id;
  initial() async {
    emit(Detail_pagesStateLoading());
    var response = await FaskesService.getFaskesById(id);
    print(response.body);
    var jsonData = jsonDecode(response.body);
    emit(Detail_pagesStateFinishedLoading(
        detailFaskesModel: DetailFaskesModel.fromJson(jsonData)));
  }

  openMaps(String lat, String lng) async {
    String googleMapslocationUrl =
        "https://www.google.com/maps/search/?api=1&query=$lat,$lng";

    Uri encodedURl = Uri.parse(googleMapslocationUrl);
    print(encodedURl);

    MapsLauncher.launchCoordinates(double.parse(lat), double.parse(lng));
  }
}
