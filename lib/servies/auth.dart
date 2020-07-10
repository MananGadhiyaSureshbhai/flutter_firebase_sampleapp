import 'package:Crew_Coffee/modals/user.dart';
import 'package:Crew_Coffee/servies/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authservice {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object
  User _userfromfirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userfromfirebase);
  }

//anoonymce
  Future signinAnon() async {
    try {
      AuthResult Result = await _auth.signInAnonymously();
      FirebaseUser user = Result.user;
      return _userfromfirebase(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

//sign in
  Future signInemailpassword(String email, String password) async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = authResult.user;

      return _userfromfirebase(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

//register
  Future Registeremailpassword(String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = authResult.user;
      await Databaseservices(uid: user.uid)
          .updateUserdata('0', "new Member", 100);
      return _userfromfirebase(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

//sign out
  Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
