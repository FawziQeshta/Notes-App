import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/custom_widgets/custom_appbar.dart';
import 'package:notes/screens/categories_screen.dart';
import 'package:notes/utils/app_colors.dart';
import '../utils/routes.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  top: 70.0, start: 25.0, end: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Login to start using app',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 80.0,
                  ),
                  Container(
                    // color: Colors.white,
                    decoration: BoxDecoration(
                        boxShadow:  [
                          BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 10,
                              color: Colors.grey.withOpacity(0.8))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'User Name',
                              hintStyle: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w300,
                                color: AppColors.hintColor
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                            ),
                            style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                color: AppColors.black
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.hintColor
                              ),
                              hintText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                              ),
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                              ),
                            ),
                            style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                color: AppColors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 53,
                    decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(50)),
                    child: MaterialButton(
                      onPressed: () {
                        Get.offAndToNamed(Routes.CATEGORIES_SCREEN);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: AppColors.hintColor,
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(SignUpScreen());
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: AppColors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
