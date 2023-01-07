import 'package:flutter/material.dart';

import '../../../../config/config.dart';

class ListCategory extends StatelessWidget {
  const ListCategory({
    Key? key,
    required this.func,
    required this.tittle,
  }) : super(key: key);
  final VoidCallback func;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 10,
        child: Container(
          height: height(context) * 13 / 100,
          width: width(context) * 90 / 100,
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.grren002),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: func,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(
                      Icons.local_hospital,
                      size: 70,
                      color: MyColors.mainColor,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      tittle,
                      style: TextStyle(fontSize: 26),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
