import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_words_app/models/my_user.dart';

abstract class AuthBase {
  Future<void> singOut();

  Future<MyUser?> currentUser();

  Future<MyUser?> singInWithGoogle();
}

class AuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSingIn = GoogleSignIn();

  Future<MyUser?> currentUser() async {
    User? user = _firebaseAuth.currentUser;

    if (user != null) {
      return MyUser(userID: user.uid, name: user.displayName, email: user.email);
    } else {
      return null;
    }
  }

  @override
  Future<void> singOut() async {
    await _googleSingIn.signOut();
    return await _firebaseAuth.signOut();
  }

  @override
  Future<MyUser?> singInWithGoogle() async {
    GoogleSignInAccount? _googleUser = await _googleSingIn.signIn();

    if (_googleUser != null) {
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        UserCredential sonuc = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken));
        User? _user = sonuc.user;
        if (_user != null) {
          return MyUser(userID: _user.uid, email: _user.email, name: _user.displayName);
        }
      }
    }
    return null;
  }
}
