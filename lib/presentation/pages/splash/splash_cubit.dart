import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState().init());

  initial(BuildContext context) async {
    await Future.delayed(Duration(seconds: 4));
    return Navigator.pushReplacementNamed(context, 'home');
  }
}
