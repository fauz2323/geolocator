part of 'detail_cubit.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState.initial() = _Initial;
  const factory DetailState.loading() = _Loading;
  const factory DetailState.loaded(FaskesDetailModel data) = _Loaded;
  const factory DetailState.error(String message) = _Error;
}
