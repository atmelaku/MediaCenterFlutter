import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() {
    return _SignUpPageState();
  }
}

final firstNameController = TextEditingController();
final lastNameController = TextEditingController();
final usernameController = TextEditingController();
final passwordController = TextEditingController();
final emailController = TextEditingController();
final dateController = TextEditingController();

Random random = new Random();
int randomNumber = random.nextInt(1000);

final firestoreInstance = FirebaseFirestore.instance;

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Column(children: <Widget>[
        TextField(
          controller: firstNameController,
          decoration: InputDecoration(hintText: 'First Name'),
        ),
        TextField(
          controller: lastNameController,
          decoration: InputDecoration(hintText: 'Last Name'),
        ),
        TextField(
          controller: usernameController,
          decoration: InputDecoration(hintText: 'username'),
        ),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(hintText: 'password'),
        ),
        TextField(
          controller: emailController,
          decoration: InputDecoration(hintText: 'email'),
        ),
        TextField(
          controller: dateController,
          decoration: InputDecoration(hintText: 'date of birth'),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          firestoreInstance.collection("profile").add({
            "first_name": firstNameController.text,
            "last_name": lastNameController.text,
            "date_of_birth": dateController.text,
            "user_ID": randomNumber,
          });
          firestoreInstance.collection("users").add({
            "username": usernameController.text,
            "password": passwordController.text,
            "email": emailController.text,
            "id": randomNumber,
            "role": "user",
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        tooltip: 'Sign Up',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}