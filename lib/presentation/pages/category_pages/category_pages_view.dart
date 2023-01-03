import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator_fe/config/config.dart';
import 'package:geolocator_fe/presentation/pages/category_pages/component/list_category.dart';

import 'category_pages_cubit.dart';
import 'category_pages_state.dart';

class Category_pagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Category_pagesCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<Category_pagesCubit>(context);
    cubit.initial();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => cubit.increment(),
      ),
      appBar: AppBar(
        title: Text("Categori Faskes"),
        elevation: 0,
      ),
      body: BlocBuilder<Category_pagesCubit, Category_pagesState>(
        builder: (context, state) => Container(
          padding: EdgeInsets.all(20),
          child: cubit.state.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: cubit.state.categoryModel.data
                      .map(
                        (e) =>
                            ListCategory(func: () {}, tittle: e.namaKategory),
                      )
                      .toList(),
                ),
        ),
      ),
    );
  }
}
