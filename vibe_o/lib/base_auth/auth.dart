import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';

abstract class BaseAuth {
  Stream<String> get onAuthStateChanged;
  Future<String> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<String> createUserWithEmailAndPassword(
    String email,
    String password,
  );

  Future<FirebaseUser> currentUser();
  Future<void> signOut();
  Future<String> signInWithGoogle();
}

class Auth implements BaseAuth {
  // Class Properties
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Inherited Methods
  @override
  Stream<String> get onAuthStateChanged =>
      _firebaseAuth.onAuthStateChanged.map((FirebaseUser user) => user?.uid);

  @override
  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    )).user.uid;
  }

  @override
  Future<FirebaseUser> currentUser() async {
    return (await _firebaseAuth.currentUser());
  }

  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    )).user.uid;
  }

  @override
  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication auth = await account.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );

    return (await _firebaseAuth.signInWithCredential(credential)).user.uid;
  }

  @override
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}
