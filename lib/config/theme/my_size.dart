import 'package:flutter/material.dart';

height(BuildContext context) {
  double size = MediaQuery.of(context).size.height;

  return size;
}

width(BuildContext context) {
  double size = MediaQuery.of(context).size.width;

  return size;
}
