import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator_fe/config/config.dart';
import 'package:geolocator_fe/presentation/pages/detail_pages/cubit/detail_cubit.dart';

class Detail_pagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    print(id);
    return BlocProvider(
      create: (BuildContext context) => DetailCubit()..initial(id),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(
              child: Center(
                child: Text(''),
              ),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (data) => Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width(context),
                      height: height(context) * 35 / 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                        ),
                        color: Colors.black,
                        image: DecorationImage(
                            image: NetworkImage(
                              'https://faskesbpjskebayoranlama.my.id/storage/' +
                                  data.faskes.gambar,
                            ),
                            fit: BoxFit.cover,
                            opacity: 0.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: Text(
                        data.faskes.namaFaskes,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Text("Kota : Kebayoran Lama"),
                            width: width(context) * 40 / 100,
                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          SizedBox(
                            child: Text("Provinsi : Jakarta"),
                            width: width(context) * 40 / 100,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 20,
                    ),
                    Center(child: Text('Alamat Lengkap :')),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 10),
                      child: Text(
                        data.faskes.alamat,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: width(context) * 90 / 100,
                        height: height(context) * 30 / 100,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Lihat Peta'),
                          ),
                        ),
                      ),
                    ),
                    //expanded button
                    Expanded(
                        child: Center(
                      child: SizedBox(
                        height: 40,
                        width: width(context) * 90 / 100,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Lihat Peta'),
                        ),
                      ),
                    ))
                  ],
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            error: (e) => Center(
              child: Text(e),
            ),
          );
        },
      ),
    );
  }
}
