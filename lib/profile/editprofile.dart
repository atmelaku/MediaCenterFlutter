import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mediacenterflutter/models/profile.dart';
import 'package:mediacenterflutter/profile/profile.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfileState createState() {
    return _EditProfileState();
  }
}

String relationship = "";
String phone = "";
String dob = "";
String job = "";
String gender = "";
String location = "";

class _EditProfileState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser.uid);
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.arrow_back),
              title: Text('Edit Profile'),
              backgroundColor: Colors.orange,
            ),
            floatingActionButton: FloatingActionButton(
              elevation: 10.0,
              child: Icon(Icons.edit),
              onPressed: () {
                CollectionReference users = FirebaseFirestore.instance.collection('users');

                Future<void> updateUser() {
                  return users
                      .doc(FirebaseAuth.instance.currentUser.uid)
                      .update({'relationship': relationship, 'phone': phone, 'dob': dob, 'job': job, 'gender': gender, 'location': location})
                      .then((value) => print("User Updated"))
                      .catchError((error) => print("Failed to update user: $error"));
                }

                updateUser();
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            body: Container(
                decoration: BoxDecoration(color: Colors.orange),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(),
                          child: GetUserName(
                              FirebaseAuth.instance.currentUser.uid)),
                      Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "Relationship",
                                      ),
                                      // check if the field is not empty unless display an error
                                      validator: (val) => val.isEmpty ? "Enter a relationship" : null,
                                      onChanged: (val) {
                                        setState(() => relationship = val);
                                      },
                                    ),),
                                Container(
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "Phone",
                                      ),
                                      // check if the field is not empty unless display an error
                                      validator: (val) => val.isEmpty ? "Enter a relationship" : null,
                                      onChanged: (val) {
                                        setState(() => phone = val);
                                      },
                                    )),
                                Container(
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "Date of Birth",
                                      ),
                                      // check if the field is not empty unless display an error
                                      validator: (val) => val.isEmpty ? "Enter a relationship" : null,
                                      onChanged: (val) {
                                        setState(() => dob = val);
                                      },
                                    )),
                                Container(
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "Job",
                                      ),
                                      // check if the field is not empty unless display an error
                                      validator: (val) => val.isEmpty ? "Enter a relationship" : null,
                                      onChanged: (val) {
                                        setState(() => job = val);
                                      },
                                    )),
                                Container(
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "Gender",
                                      ),
                                      // check if the field is not empty unless display an error
                                      validator: (val) => val.isEmpty ? "Enter a relationship" : null,
                                      onChanged: (val) {
                                        setState(() => gender = val);
                                      },
                                    )),
                                Container(
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "Location",
                                      ),
                                      // check if the field is not empty unless display an error
                                      validator: (val) => val.isEmpty ? "Enter a relationship" : null,
                                      onChanged: (val) {
                                        setState(() => location = val);
                                      },
                                    )),
                              ])),
                    ]))));
  }
}
