import 'package:bloc/bloc.dart';

import 'maps_pages_state.dart';

class Maps_pagesCubit extends Cubit<Maps_pagesState> {
  Maps_pagesCubit() : super(Maps_pagesState().init());
}
