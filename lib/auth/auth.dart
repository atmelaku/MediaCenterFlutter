import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediacenterflutter/models/database.dart';
import 'package:mediacenterflutter/models/user.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//  create a user object based on firebaseUser <=> user id which is (uid from Users class in models/user file)
  Users _userFromFirebaseUser(User user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  // auth change user stream

  Stream<Users> get user {
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }


  //register with email and password

  Future registerWithEmailAndPassword(String firstName, String lastName, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      // await  DatabaseServer(uid: user.uid).updateUserData(email, password);
      //create a new document

      // await  DatabaseServer(uid: user.uid).updateUserProfile(firstName, lastName);

      await  DatabaseServer(uid: user.uid).updateUserData(firstName, lastName, email, password);

      return _userFromFirebaseUser(user);


    } catch(e) {
      print(e.toString());
      return null;

    }

  }


//  login with email and password

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      // await  DatabaseServer(uid: user.uid).updateUserData(email, password);
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;

    }

  }
//log out system

  Future signOut() async {
    try {
      return await _auth.signOut();
    }catch(e) {
      print(e.toString());
      return null;
    }
  }

}