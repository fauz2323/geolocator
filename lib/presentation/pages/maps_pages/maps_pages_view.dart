import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'maps_pages_cubit.dart';
import 'maps_pages_state.dart';

class Maps_pagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Maps_pagesCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<Maps_pagesCubit>(context);

    return Container();
  }
}


