import 'package:bloc/bloc.dart';
import 'package:depi_five/ecommerce_app/core/helpers/hive_helper.dart';
import 'package:depi_five/ecommerce_app/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login({required String email, required String password}) async {
    emit(AuthLoadingState());
    await Future.delayed(Duration(seconds: 3));
    if (email == "ahmed@gmail.com" && password == "123456") {
      HiveHelper.setLoginBox();
      Get.offAll(HomeScreen());
      //Success
      emit(AuthSuccessState());
    } else {
      Get.snackbar(
        "Error",
        "Your credintials isn't correct",
        backgroundColor: Colors.red,
      );
      emit(AuthErrorState());
    }
  }
}
