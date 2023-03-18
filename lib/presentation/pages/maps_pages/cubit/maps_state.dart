part of 'maps_cubit.dart';

@freezed
class MapsState with _$MapsState {
  const factory MapsState.initial() = _Initial;
  const factory MapsState.loading() = _Loading;
  const factory MapsState.loaded(
      CoordinateModel coordinateModel,
      LatLng currentPossition,
      MapController mapController,
      DetailMaps detailMaps) = _Loaded;
  const factory MapsState.error(String error) = _Error;
}
