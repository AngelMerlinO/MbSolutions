import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authuser {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> LoginGoogle() async {
    try {
      // Inicia el flujo de inicio de sesión con Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // El usuario canceló el inicio de sesión
        return null;
      }

      // Obtiene la autenticación de Google
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Crea una credencial para Firebase
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Inicia sesión en Firebase con la credencial de Google
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print('Error en Google Sign-In: $e');
      rethrow;
    }
  }
}