import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/config/config.dart';

import 'home_pages_cubit.dart';
import 'home_pages_state.dart';

class Home_pagesPage extends StatelessWidget {
  const Home_pagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Home_pagesCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<Home_pagesCubit>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height(context) * 40 / 100,
            width: width(context),
            decoration: BoxDecoration(
              color: MyColors.grren001,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Container(
                  height: height(context) * 32 / 100,
                  child: Text("Header"),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
                    width: width(context) * 80 / 100,
                    height: height(context) * 50 / 100,
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: [
                        Material(
                          elevation: 8,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyColors.grren002.withOpacity(0.1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.local_hospital_outlined,
                                  size: 80,
                                  color: MyColors.mainColor,
                                ),
                                Text("Fasilitas Kesehatan")
                              ],
                            ),
                          ),
                        ),
                        Material(
                          elevation: 8,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyColors.grren002.withOpacity(0.1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.list_alt,
                                  size: 80,
                                  color: MyColors.mainColor,
                                ),
                                Text("Kategori Faskes")
                              ],
                            ),
                          ),
                        ),
                        Material(
                          elevation: 8,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyColors.grren002.withOpacity(0.1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.map_sharp,
                                  size: 80,
                                  color: MyColors.mainColor,
                                ),
                                Text("Lokasi Faskes")
                              ],
                            ),
                          ),
                        ),
                        Material(
                          elevation: 8,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyColors.grren002.withOpacity(0.1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.tips_and_updates_sharp,
                                  size: 80,
                                  color: MyColors.mainColor,
                                ),
                                Text("Tentang Aplikasi")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
