import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/auth_controller.dart';
import 'package:notes/utils/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var hintStyle = const TextStyle(
      fontSize: 20.0,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w300,
      color: AppColors.hintColor);

  var textStyle = const TextStyle(
      fontSize: 20.0,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      color: AppColors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  top: 70.0, start: 25.0, end: 25.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Nunito',
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Create an account',
                      style: TextStyle(
                        color: AppColors.hintColor,
                        fontSize: 18.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      // color: Colors.white,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 5),
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
                              decoration: InputDecoration(
                                hintText: 'First Name',
                                hintStyle: hintStyle,
                              ),
                              style: textStyle,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              controller: firstNameController,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Last Name',
                                hintStyle: hintStyle,
                              ),
                              style: textStyle,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              controller: lastNameController,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: hintStyle,
                              ),
                              style: textStyle,
                              textInputAction: TextInputAction.next,
                              controller: emailController,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: 'Phone',
                                hintStyle: hintStyle,
                              ),
                              style: textStyle,
                              textInputAction: TextInputAction.next,
                              controller: phoneController,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                suffixIcon: const Icon(
                                  Icons.remove_red_eye,
                                ),
                                hintStyle: hintStyle,
                              ),
                              style: textStyle,
                              controller: passwordController,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 53,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(50)),
                      child: MaterialButton(
                        onPressed: () {
                          AuthController.instance.register(
                              firstNameController.text.trim(),
                              lastNameController.text.trim(),
                              emailController.text.trim(),
                              phoneController.text.trim(),
                              passwordController.text.trim());
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
