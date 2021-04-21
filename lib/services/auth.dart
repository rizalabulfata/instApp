import 'package:firebase_auth/firebase_auth.dart';
import 'package:instApp/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // membuat objek dari class PriveUser berdasarkan FirebaseUer
  PriveUser _userFromFirebaseUser(User user) {
    return user != null ? PriveUser(uid: user.uid) : null;
  }

  // mengubah user stream
  Stream<PriveUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // anonymous login
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // login menggunakan email dan password
  Future signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // registrasi user dengan email dan password
  Future registerWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
