import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'faskes_pages_cubit.dart';
import 'faskes_pages_state.dart';

class Faskes_pagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Faskes_pagesCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<Faskes_pagesCubit>(context);

    return Container();
  }
}


