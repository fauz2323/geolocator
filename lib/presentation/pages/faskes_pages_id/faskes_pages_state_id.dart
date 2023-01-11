import 'package:geolocator_fe/data/model/faskes_category_model.dart';

import '../../../data/model/faskes_model.dart';

class Faskes_pagesState_id {}

class Faskes_Initial extends Faskes_pagesState_id {}

class Faskes_Loading extends Faskes_pagesState_id {}

class Faskes_FinishedLoading extends Faskes_pagesState_id {
  final FaskesCategoryModel faskesModel;

  Faskes_FinishedLoading({required this.faskesModel});
}
