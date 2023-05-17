import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda_app/src/pages/auth/controller/auth_controller.dart';
import 'package:quitanda_app/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda_app/src/services/validators.dart';

class ForgotPasswordDialog extends StatelessWidget {
  final emailController = TextEditingController();
  final _formFieldKey = GlobalKey<FormFieldState>();
  final authController = Get.find<AuthController>();

  ForgotPasswordDialog({
    required String email,
    Key? key,
  }) : super(key: key) {
    emailController.text = email;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Password recovery',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                // Description
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                  ),
                  child: Text(
                    'An email will be sent to the entered email',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),

                // Campo de email
                CustomTextField(
                  formFieldKey: _formFieldKey,
                  controller: emailController,
                  icon: Icons.email,
                  label: 'Email',
                  validator: emailValidator,
                ),

                // Confirmar
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: () {
                    if (_formFieldKey.currentState!.validate()) {
                      authController.passwordRecovery(emailController.text);
                      Get.back(result: true);
                    }
                  },
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Botão para fechar
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
