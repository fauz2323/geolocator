import 'package:geolocator_fe/data/model/category_model.dart';

class Category_pagesState {
  late CategoryModel categoryModel;
  bool isLoading = true;
  int data = 0;

  Category_pagesState init() {
    return Category_pagesState();
  }

  Category_pagesState clone() {
    return Category_pagesState();
  }
}
