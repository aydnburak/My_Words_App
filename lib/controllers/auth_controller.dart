import 'package:get/get.dart';
import 'package:my_words_app/locator.dart';
import 'package:my_words_app/models/my_user.dart';
import 'package:my_words_app/repositorys/auth_repository.dart';

class AuthController extends GetxController {
  MyUser? _myUser;
  RxBool isUser = false.obs;
  RxBool isloading = false.obs;

  MyUser? get myUser => _myUser;
  final AuthRepository _authRepository = locator<AuthRepository>();

  @override
  void onInit() {
    super.onInit();
    currentUser();
  }

  Future<void> currentUser() async {
    isloading.value = true;
    _myUser = await _authRepository.currentUser();
    if (_myUser != null) {
      isUser.value = true;
    } else {
      isUser.value = false;
    }
    isloading.value = false;
  }

  Future<void> singOut() async {
    isloading.value = true;
    await _authRepository.singOut();
    isUser.value = false;
    _myUser = null;
    isloading.value = false;
  }

  Future<void> singInWithGoogle() async {
    try {
      isloading.value = true;
      _myUser = await _authRepository.singInWithGoogle();
      if (_myUser != null) {
        isUser.value = true;
      } else {
        isUser.value = false;
      }
    } finally {
      isloading.value = false;
    }
  }
}
