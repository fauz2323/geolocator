import 'package:bloc/bloc.dart';

import 'home_pages_state.dart';

class Home_pagesCubit extends Cubit<Home_pagesState> {
  Home_pagesCubit() : super(Home_pagesState().init());
}
