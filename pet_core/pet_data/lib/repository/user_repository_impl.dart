import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pet_domain/model/user/google_sign_in.dart';
import 'package:pet_domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<GoogleSignInResult?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return GoogleSignInResult();
  }
}
