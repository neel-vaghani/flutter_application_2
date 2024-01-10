import 'package:flutter/material.dart';
import 'package:flutter_application_2/module/auth/controller/auth_controller.dart';
import 'package:flutter_application_2/module/auth/service/auth_service.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  static String id = 'signup_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthController authController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    authController.signUpEmailController.clear();
    authController.signupPasswordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Vision 11',
                style: TextStyle(
                  fontFamily: 'Billabong',
                  fontSize: 50.0,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                      child: TextFormField(
                        controller: authController.signUpEmailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (input) => !input!.contains('@')
                            ? 'Please enter a valid email'
                            : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                      child: TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Password'),
                        validator: (input) => input!.length < 6
                            ? 'Must be at least 6 characters'
                            : null,
                        controller: authController.signupPasswordController,
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 40,
                        right: 40,
                      ),
                      child: Container(
                        width: double.infinity,
                        color: Colors.blue,
                        child: Obx(
                          () => authController.showLoaderInSinginScreen.value
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : TextButton(
                                  onPressed: () => _signUp(),
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      color: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Back to Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      authController.signUp(context);
    }
  }
}
