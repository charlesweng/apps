import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:logger/logger.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  BrewCrewUser? _userFromFirebaseUser(User? user) {
    return user != null ? BrewCrewUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<BrewCrewUser?> get user {
    return _auth.userChanges()
      .map(_userFromFirebaseUser);
  }

  var logger = Logger(
    printer: PrettyPrinter()
  );

  // sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential authResult = await _auth.signInAnonymously();
      return _userFromFirebaseUser(authResult.user);
    } catch(e) {
      logger.e(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signIn(String email, String password) async {
    try {
      UserCredential userCred = await _auth
      .signInWithEmailAndPassword(email: email, password: password);
      logger.i(userCred.user!.uid);
      return _userFromFirebaseUser(userCred.user);
    } catch (e) {
      logger.e(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCred = await _auth
      .createUserWithEmailAndPassword(email: email, password: password);
      // create new document with uid
      await DatabaseService(uid: userCred.user!.uid).updateUserData('0', 'new crew member', 100);
      return _userFromFirebaseUser(userCred.user);
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      logger.e(e.toString());
    }
  }
}