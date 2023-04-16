import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator_fe/data/model/faskes_category_argument.dart';
import 'package:geolocator_fe/presentation/pages/category_pages/component/list_category.dart';
import 'package:geolocator_fe/presentation/pages/category_pages/cubit/category_cubit.dart';

import '../faskes_pages/faskes_pages_view.dart';
import '../faskes_pages_id/faskes_pages_view_id.dart';

class Category_pagesPage extends StatelessWidget {
  Category_pagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CategoryCubit()..initial(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategori Faskes"),
        elevation: 0,
      ),
      body: Column(
        children: [
          BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
            return state.maybeWhen(
              orElse: () => Container(),
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (categoryModel) => Center(
                child: Column(
                  children: [
                    Column(
                      children: categoryModel.data
                          .map(
                            (e) => ListCategory(
                                func: () {
                                  //ketika di klik akan masuk ke variabel namaCategory
                                  Navigator.pushNamed(context, 'faskes_id',
                                      arguments: FaskesCategoryArgument(
                                          e.id.toString(), e.namaKategory));
                                },
                                tittle: e.namaKategory),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              error: (error) => Center(
                child: Text(error),
              ),
            );
          }),
        ],
      ),
    );
  }
}
