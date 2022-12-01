import 'package:bloc/bloc.dart';

import 'faskes_pages_state.dart';

class Faskes_pagesCubit extends Cubit<Faskes_pagesState> {
  Faskes_pagesCubit() : super(Faskes_pagesState().init());
}
