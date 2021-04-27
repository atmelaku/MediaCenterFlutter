import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseServer {
  final String uid;

  DatabaseServer({this.uid});

  final CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future updateUserData(String firstName, String lastName, String email, String password) async {
    return await users.doc(uid).set({
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,

    });
  }


// store first name ans last name in to profile collection

  // final CollectionReference profile = FirebaseFirestore.instance.collection("profile");

  // Future updateUserProfile(String firstName, String lastName) async {
  //   return await users.doc(uid).set({
  //     "firstName": firstName,
  //     "lastName": lastName,
      

  //   });
  // }
// ignore: non_constant_identifier_names
  Stream<QuerySnapshot> get userData{
    return users.snapshots();
  }

}

