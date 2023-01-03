import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator_fe/config/config.dart';
import 'package:geolocator_fe/presentation/pages/detail_pages/detail_pages_view.dart';

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
    cubit.initial();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Fasilitas Kesehatan"),
      ),
      body: BlocBuilder<Faskes_pagesCubit, Faskes_pagesState>(
        builder: (context, state) => cubit.state.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: cubit.state.faskesModel.allFaskes
                    .map(
                      (e) => ListFaskes(
                        func: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail_pagesPage(),
                            settings: RouteSettings(arguments: e.id),
                          ),
                        ),
                        image:
                            'https://cdn.antaranews.com/cache/800x533/2022/06/21/FOTO-Advent.png',
                        id: e.id,
                        tittle: e.namaFaskes,
                        alamat: e.alamat,
                      ),
                    )
                    .toList(),
              ),
      ),
    );
  }
}

class ListFaskes extends StatelessWidget {
  const ListFaskes({
    Key? key,
    required this.image,
    required this.id,
    required this.tittle,
    required this.alamat,
    required this.func,
  }) : super(key: key);
  final String image;
  final int id;
  final VoidCallback func;
  final String tittle;
  final String alamat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        width: width(context) * 90 / 100,
        height: height(context) * 25 / 100,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: func,
            splashColor: Colors.black.withOpacity(0.4),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height(context) * 12 / 100,
                  ),
                  Text(
                    tittle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    alamat,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
