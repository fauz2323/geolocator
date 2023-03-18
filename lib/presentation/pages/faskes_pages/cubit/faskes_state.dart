part of 'faskes_cubit.dart';

@freezed
class FaskesState with _$FaskesState {
  const factory FaskesState.initial() = _Initial;
  const factory FaskesState.loading() = _Loading;
  const factory FaskesState.loaded(FaskesModel faskesModel) = _Loaded;
  const factory FaskesState.error(String error) = _Error;
}
