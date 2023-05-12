import 'package:flutter/material.dart';
import 'package:quitanda_app/src/config/custom_colors.dart';
import 'package:quitanda_app/src/pages/auth/sign_in_page.dart';
import 'package:quitanda_app/src/pages/common_widgets/app_name_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          milliseconds: 2500,
        ), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c) {
        return const SignInPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColors.customSwatchColor,
              CustomColors.customSwatchColor.shade700,
              CustomColors.customSwatchColor.shade800,
              CustomColors.customSwatchColor.shade900,
            ],
          ),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppNameWidget(
              textSize: 50.0,
              greenTitleColor: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.0,
              ),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
