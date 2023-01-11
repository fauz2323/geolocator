import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator_fe/config/config.dart';
import 'package:latlong2/latlong.dart';

import 'detail_pages_cubit.dart';
import 'detail_pages_state.dart';

class Detail_pagesPage extends StatelessWidget {
  final int id;

  const Detail_pagesPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Detail_pagesCubit(id)..initial(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<Detail_pagesCubit>(context);
    final id = ModalRoute.of(context)!.settings.arguments;
    print(id);
    return Scaffold(
      body: BlocBuilder<Detail_pagesCubit, Detail_pagesState>(
          builder: (context, state) {
        if (state is InitialDetail_pagesState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Detail_pagesStateLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Detail_pagesStateFinishedLoading) {
          return Stack(
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
                            'https://cdn.antaranews.com/cache/800x533/2022/06/21/FOTO-Advent.png',
                          ),
                          fit: BoxFit.cover,
                          opacity: 0.5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      "Nama RS",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
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
                          child: Text("Kota : Jakarta"),
                          width: width(context) * 30 / 100,
                        ),
                        VerticalDivider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          child: Text("Provinsi : Jakarta"),
                          width: width(context) * 30 / 100,
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
                      state.detailFaskesModel.faskes?.alamat ?? '-',
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
                        child: FlutterMap(
                          options: MapOptions(
                            center: LatLng(
                              double.parse(
                                  state.detailFaskesModel.faskes?.latitude ??
                                      "0.0"),
                              double.parse(
                                  state.detailFaskesModel.faskes?.longitude ??
                                      "0.0"),
                            ),
                            zoom: 14.2,
                          ),
                          mapController: state.mapController,
                          children: [
                            TileLayer(
                              urlTemplate:
                                  "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                              userAgentPackageName:
                                  'dev.fleaflet.flutter_map.example',
                            ),
                            MarkerLayer(markers: [
                              Marker(
                                point: LatLng(
                                  double.parse(state
                                          .detailFaskesModel.faskes?.latitude ??
                                      "0.0"),
                                  double.parse(state.detailFaskesModel.faskes
                                          ?.longitude ??
                                      "0.0"),
                                ),
                                builder: (context) {
                                  return Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                  );
                                },
                              ),
                            ]),
                          ],
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
                        onPressed: () {
                          cubit.openMaps(
                              state.detailFaskesModel.faskes?.latitude ?? '0',
                              state.detailFaskesModel.faskes?.longitude ?? '0');
                        },
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
          );
        } else {
          return Center(
            child: Text("Error"),
          );
        }
      }),
    );
  }
}
