import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator_fe/config/config.dart';
import 'package:geolocator_fe/presentation/pages/detail_pages/detail_pages_view.dart';
import 'package:geolocator_fe/presentation/pages/faskes_pages/cubit/faskes_cubit.dart';

import '../../../data/model/detail_argument.dart';

class Faskes_pagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FaskesCubit()..initial(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.grren001,
        elevation: 0,
        title: Text(
          "Fasilitas Kesehatan",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<FaskesCubit, FaskesState>(builder: (context, state) {
        return state.maybeWhen(
          orElse: () => Container(),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (faskesModel) => ListView(
            children: faskesModel.allFaskes
                .map(
                  (e) => ListFaskes(
                    func: () => Navigator.pushNamed(
                      context,
                      'detail',
                      arguments: DetailArgument(e.id.toString(), e.namaFaskes),
                    ),
                    image: 'https://faskesbpjskebayoranlama.my.id/storage/' +
                        e.gambar,
                    id: e.id,
                    tittle: e.namaFaskes,
                    alamat: e.alamat,
                  ),
                )
                .toList(),
          ),
          error: (error) => Center(
            child: Text(error),
          ),
        );
      }),
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
