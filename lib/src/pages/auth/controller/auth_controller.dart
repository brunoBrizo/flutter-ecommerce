import 'package:get/get.dart';
import 'package:quitanda_app/src/constants/storage_keys.dart';
import 'package:quitanda_app/src/models/user_model.dart';
import 'package:quitanda_app/src/pages/auth/repository/auth_repository.dart';
import 'package:quitanda_app/src/pages/auth/result/auth_result.dart';
import 'package:quitanda_app/src/pages_routes/app_pages.dart';
import 'package:quitanda_app/src/services/utils_services.dart';

class AuthController extends GetxController {
  final AuthRepository repository = AuthRepository();
  final UtilsServices utils = UtilsServices();
  UserModel user = UserModel();
  RxBool isLoading = false.obs;

// This runs always on GetxController
  // @override
  // void onInit() {
  //   super.onInit();
  //   validateToken();
  // }

  void saveTokenAndProceedToBase() {
    utils.saveLocalData(
      key: StorageKeys.token,
      data: user.token!,
    );

    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result = await repository.signIn(
      email: email,
      password: password,
    );

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        utils.showToast(
          msg: message,
          isError: true,
        );
      },
    );
  }

  Future<void> validateToken() async {
    String? token = await utils.getLocalData(
      key: StorageKeys.token,
    );

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }

    AuthResult result = await repository.validateToken(token);
    result.when(
      success: (user) {
        this.user = user;

        saveTokenAndProceedToBase();
      },
      error: (message) {
        signOut();
      },
    );
  }

  Future<void> signOut() async {
    user = UserModel();
    await utils.removeLocalData(key: StorageKeys.token);
    Get.offAllNamed(PagesRoutes.signInRoute);
  }
}
