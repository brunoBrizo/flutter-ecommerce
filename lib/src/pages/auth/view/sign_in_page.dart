import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda_app/src/config/custom_colors.dart';
import 'package:quitanda_app/src/pages/auth/controller/auth_controller.dart';
import 'package:quitanda_app/src/pages/auth/view/components/forgot_password_dialog.dart';
import 'package:quitanda_app/src/pages/common_widgets/app_name_widget.dart';
import 'package:quitanda_app/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda_app/src/pages_routes/app_pages.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:quitanda_app/src/services/utils_services.dart';
import 'package:quitanda_app/src/services/validators.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final UtilsServices utils = UtilsServices();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App name
                    const AppNameWidget(
                      textSize: 40.0,
                      greenTitleColor: Colors.white,
                    ),
                    // Categories animation
                    SizedBox(
                      height: 30.0,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25.0,
                        ),
                        child: AnimatedTextKit(
                            repeatForever: true,
                            pause: Duration.zero,
                            animatedTexts: [
                              FadeAnimatedText('Fruits'),
                              FadeAnimatedText('Vegetables'),
                              FadeAnimatedText('Meat'),
                              FadeAnimatedText('Milk'),
                              FadeAnimatedText('Cereals'),
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              // Sign in/up form
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 40.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50.0))),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Email text field
                      CustomTextField(
                        icon: Icons.email,
                        label: 'Email',
                        controller: emailController,
                        textType: TextInputType.emailAddress,
                        validator: emailValidator,
                      ),
                      // Password text field
                      CustomTextField(
                        icon: Icons.lock,
                        label: 'Password',
                        isSecret: true,
                        controller: passwordController,
                        validator: passwordValidator,
                      ),
                      // Sign in button
                      SizedBox(
                          height: 50.0,
                          child: GetX<AuthController>(
                            builder: (authController) {
                              return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0))),
                                  onPressed: authController.isLoading.value
                                      ? null
                                      : () {
                                          FocusScope.of(context).unfocus();

                                          if (_formKey.currentState!
                                              .validate()) {
                                            String email = emailController.text;
                                            String password =
                                                passwordController.text;

                                            authController.signIn(
                                              email: email,
                                              password: password,
                                            );
                                          }
                                        },
                                  child: authController.isLoading.value
                                      ? const CircularProgressIndicator()
                                      : const Text(
                                          'Sign in',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white),
                                        ));
                            },
                          )),
                      // Forgot password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () async {
                              final bool? result = await showDialog(
                                context: context,
                                builder: (_) {
                                  return ForgotPasswordDialog(
                                      email: emailController.text);
                                },
                              );

                              if (result ?? false) {
                                utils.showToast(
                                  msg:
                                      'Check your inbox for the recovery email',
                                );
                              }
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                  color: CustomColors.customContrastColor),
                            )),
                      ),
                      // Divider
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 1.0,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'Or',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Sign up button
                      SizedBox(
                        height: 50.0,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)),
                                side: BorderSide(
                                    width: 2.0,
                                    color: CustomColors.customSwatchColor)),
                            onPressed: () {
                              Get.toNamed(PagesRoutes.signUpRoute);
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(fontSize: 18.0),
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
