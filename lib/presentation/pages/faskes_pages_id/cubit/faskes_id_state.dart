part of 'faskes_id_cubit.dart';

@freezed
class FaskesIdState with _$FaskesIdState {
  const factory FaskesIdState.initial() = _Initial;
  const factory FaskesIdState.loading() = _Loading;
  const factory FaskesIdState.loaded(FaskesCategoryModel faskesModel) = _Loaded;
  const factory FaskesIdState.error(String error) = _Error;
}
