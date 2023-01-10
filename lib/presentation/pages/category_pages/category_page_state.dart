part of 'category_page_cubit.dart';

abstract class CategoryPageState {}

class CategoryPageInitial extends CategoryPageState {}

class CategoryPageLoading extends CategoryPageInitial {}

class CategoryFinishedLoading extends CategoryPageInitial {
  final CategoryModel categoryModel;
  final int number;
  final String recentLocation;

  CategoryFinishedLoading(this.categoryModel, this.number, this.recentLocation);
}

class CategoryName extends CategoryPageInitial {
  final String namaCategory;

  CategoryName(this.namaCategory);
}

class CategoryPageError extends CategoryPageInitial {}


// number,recentLocation,categoryModel