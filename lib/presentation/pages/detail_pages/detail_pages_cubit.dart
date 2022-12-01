import 'package:bloc/bloc.dart';

import 'detail_pages_state.dart';

class Detail_pagesCubit extends Cubit<Detail_pagesState> {
  Detail_pagesCubit() : super(Detail_pagesState().init());
}
