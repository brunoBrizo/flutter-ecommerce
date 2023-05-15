import 'package:get/get.dart';
import 'package:quitanda_app/src/pages/auth/repository/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository repository = AuthRepository();
  RxBool isLoading = false.obs;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    final result = await repository.signIn(
      email: email,
      password: password,
    );

    isLoading.value = false;
  }
}
