import 'package:bloc/bloc.dart';

import 'about_pages_state.dart';

class About_pagesCubit extends Cubit<About_pagesState> {
  About_pagesCubit() : super(About_pagesState().init());
}
