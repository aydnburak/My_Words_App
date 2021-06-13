import 'package:my_words_app/locator.dart';
import 'package:my_words_app/models/my_user.dart';
import 'package:my_words_app/services/auth_service.dart';

class AuthRepository implements AuthBase {
  final AuthService _authService = locator<AuthService>();

  @override
  Future<MyUser?> currentUser() async {
    return await _authService.currentUser();
  }

  @override
  Future<void> singOut() async {
    return await _authService.singOut();
  }

  @override
  Future<MyUser?> singInWithGoogle() async {
    return await _authService.singInWithGoogle();
  }
}
