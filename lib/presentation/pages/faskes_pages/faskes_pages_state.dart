import '../../../data/model/faskes_model.dart';

class Faskes_pagesState {}

class Faskes_Initial extends Faskes_pagesState {}

class Faskes_Loading extends Faskes_pagesState {}

class Faskes_FinishedLoading extends Faskes_pagesState {
  final FaskesModel faskesModel;

  Faskes_FinishedLoading({required this.faskesModel});
}
