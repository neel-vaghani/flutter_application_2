// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/module/auth/service/auth_service.dart';
import 'package:flutter_application_2/module/dashboard/view/screen/dashboard_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // FLAG
  RxBool showLoaderInSinginScreen = false.obs;
  RxBool showLoaderInLoginScreen = false.obs;

  //SIGN UP DATA
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();

  // LOGIN DATA
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  // METHODS
  Future<void> signUp(BuildContext context) async {
    showLoaderInSinginScreen.value = true;
    String result = await AuthService().signUpUser(
      email: signUpEmailController.text,
      password: signupPasswordController.text,
    );
    if (result != 'success') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result)));
    } else {
      Navigator.pop(context);
    }
    showLoaderInSinginScreen.value = false;
  }

  Future<void> login(BuildContext context) async {
    showLoaderInLoginScreen.value = true;

    String result = await AuthService().logInUser(
      email: loginEmailController.text,
      password: loginPasswordController.text,
    );
    if (result == 'success') {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashBoardScreen(),
          ));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result)));
    }
    showLoaderInLoginScreen.value = false;
  }
}
