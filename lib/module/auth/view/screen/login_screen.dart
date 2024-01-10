import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/module/auth/controller/auth_controller.dart';
import 'package:flutter_application_2/module/auth/service/auth_service.dart';
import 'package:flutter_application_2/module/auth/view/common_widget/error_dialog.dart';
import 'dart:io';

import 'package:flutter_application_2/module/auth/view/screen/sign_up_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen';

  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authController = Get.put(AuthController());

  @override
  void dispose() {
    super.dispose();
    authController.loginEmailController.clear();
    authController.loginPasswordController.clear();
  }

  void _logInUser() async {
    if (authController.loginEmailController.text.isEmpty) {
      showErrorDialog(context, "Email");
    } else if (authController.loginPasswordController.text.isEmpty) {
      showErrorDialog(context, "Password");
    }
    authController.login(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 25.0, bottom: 15.0),
              child: Text(
                'Vision 11',
                style: TextStyle(fontFamily: 'Billabong', fontSize: 50.0),
              ),
            ),
            Container(
              child: TextField(
                controller: authController.loginEmailController,
                decoration: const InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    isDense: true),
                style: const TextStyle(fontSize: 12.0, color: Colors.black),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: TextField(
                controller: authController.loginPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    isDense: true),
                style: const TextStyle(fontSize: 12.0, color: Colors.black),
              ),
            ),
            GestureDetector(
              onTap: _logInUser,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10.0),
                width: 500.0,
                height: 40.0,
                color: Colors.blue,
                child: Obx(
                  () => authController.showLoaderInLoginScreen.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          "Log In",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return Container(
      alignment: Alignment.center,
      height: 49.5,
      child: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 1.0,
                color: Colors.grey.withOpacity(0.7),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Don\'t have an account?',
                          style: TextStyle(fontSize: 12.0, color: Colors.grey)),
                      TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            )),
                        child: const Text('Sign Up.',
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.grey)),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
