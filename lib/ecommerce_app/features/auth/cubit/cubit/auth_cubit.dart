import 'package:bloc/bloc.dart';
import 'package:depi_five/ecommerce_app/core/helpers/hive_helper.dart';
import 'package:depi_five/ecommerce_app/core/network/dio_helper.dart';
import 'package:depi_five/ecommerce_app/core/network/k_apis.dart';
import 'package:depi_five/ecommerce_app/features/auth/model/login_model.dart';
import 'package:depi_five/ecommerce_app/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login({required String email, required String password}) async {
    emit(AuthLoadingState());
    try {
      final response = await DioHelper.postData(
        KApis.login,
        body: {"email": email, "password": password},
      );
      final loginModel = LoginModel.fromJson(response.data);
      if (loginModel.statusCode == 200) {
        HiveHelper.setTokenBox(loginModel.data!.token!);
        Get.offAll(HomeScreen());
        emit(AuthSuccessState());
      } else {
        Get.snackbar("Error", loginModel.message!, backgroundColor: Colors.red);
        emit(AuthErrorState());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
      emit(AuthErrorState());
    }
  }
}
