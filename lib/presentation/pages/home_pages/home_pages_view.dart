import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator_fe/config/config.dart';
import 'package:geolocator_fe/presentation/pages/category_pages/category_pages_view.dart';
import 'package:geolocator_fe/presentation/pages/faskes_pages/faskes_pages_view.dart';
import 'package:geolocator_fe/presentation/pages/maps_pages/maps_pages_view.dart';

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
                  child: Image.asset(
                    'asset/img/logo.png',
                    width: 200,
                    height: 200,
                  ),
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
                        ItemListHome(
                          func: () => Navigator.pushNamed(context, 'faskes'),
                          tittle: "Fasilitasn Kesehatan",
                          icon: Icons.local_hospital_outlined,
                        ),
                        ItemListHome(
                          func: () => Navigator.pushNamed(context, 'category'),
                          tittle: "Kategori Faskes",
                          icon: Icons.list_alt,
                        ),
                        ItemListHome(
                          func: () => Navigator.pushNamed(context, 'maps'),
                          tittle: "Lokasi Faskes",
                          icon: Icons.map_sharp,
                        ),
                        ItemListHome(
                          func: () {},
                          tittle: "Tentang Aplikasi",
                          icon: Icons.tips_and_updates_sharp,
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

class ItemListHome extends StatelessWidget {
  const ItemListHome({
    Key? key,
    required this.func,
    required this.icon,
    required this.tittle,
  }) : super(key: key);
  final VoidCallback func;
  final IconData icon;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        onTap: func,
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
                icon,
                size: 80,
                color: MyColors.mainColor,
              ),
              Text(tittle)
            ],
          ),
        ),
      ),
    );
  }
}
