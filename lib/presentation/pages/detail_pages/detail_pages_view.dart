import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator_fe/config/config.dart';

import 'detail_pages_cubit.dart';
import 'detail_pages_state.dart';

class Detail_pagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Detail_pagesCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<Detail_pagesCubit>(context);
    final id = ModalRoute.of(context)!.settings.arguments;
    print(id);
    return Scaffold(
      body: BlocBuilder<Detail_pagesCubit, Detail_pagesState>(
        builder: (context, state) => Stack(
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
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  height: 20,
                ),
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
      ),
    );
  }
}
