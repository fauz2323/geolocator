import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/config/config.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text("Category Faskes"),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(20),
                height: height(context) * 15 / 100,
                width: width(context) * 90 / 100,
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.grren002),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.local_hospital,
                      size: 80,
                      color: MyColors.mainColor,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Nama Faskes",
                      style: TextStyle(fontSize: 26),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
