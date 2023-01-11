import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator_fe/data/model/detail_model.dart';

class Detail_pagesState {}

class InitialDetail_pagesState extends Detail_pagesState {}

class Detail_pagesStateLoading extends Detail_pagesState {}

class Detail_pagesStateFinishedLoading extends Detail_pagesState {
  final DetailFaskesModel detailFaskesModel;
  MapController mapController = MapController();
  Detail_pagesStateFinishedLoading({required this.detailFaskesModel});
}
