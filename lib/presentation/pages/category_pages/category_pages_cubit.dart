import 'package:bloc/bloc.dart';

import 'category_pages_state.dart';

class Category_pagesCubit extends Cubit<Category_pagesState> {
  Category_pagesCubit() : super(Category_pagesState().init());
}
