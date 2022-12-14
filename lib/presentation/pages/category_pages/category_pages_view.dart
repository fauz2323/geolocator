import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator_fe/presentation/pages/category_pages/category_page_cubit.dart';
import 'package:geolocator_fe/presentation/pages/category_pages/component/list_category.dart';
import 'package:geolocator_fe/presentation/pages/faskes_pages_id/faskes_pages_cubit_id.dart';

import '../faskes_pages/faskes_pages_view.dart';
import '../faskes_pages_id/faskes_pages_view_id.dart';

class Category_pagesPage extends StatelessWidget {
  Category_pagesPage({super.key});

  final CategoryPageCubit cubit = CategoryPageCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CategoryPageCubit()..initial(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<CategoryPageCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Categori Faskes"),
        elevation: 0,
      ),
      body: Column(
        children: [
          BlocBuilder<CategoryPageCubit, CategoryPageState>(
              builder: (context, state) {
            if (state is CategoryPageLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CategoryFinishedLoading) {
              return Center(
                child: Column(
                  children: [
                    Text(state.recentLocation),
                    Column(
                      children: state.categoryModel.data
                          .map(
                            (e) => ListCategory(
                                func: () {
                                  //ketika di klik akan masuk ke variabel namaCategory
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Faskes_pagesPage_id(
                                          id: e.id,
                                        ),
                                      ));
                                },
                                tittle: e.namaKategory),
                          )
                          .toList(),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text("Error"),
              );
            }
          }),
        ],
      ),
    );
  }
}
