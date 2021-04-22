import 'package:flutter/material.dart';
import 'package:mediacenterflutter/auth/login.dart';
import 'package:mediacenterflutter/auth/signup.dart';
import 'package:mediacenterflutter/post/createPost.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Media Center')),
      body: Container(
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }, child: Container(child: Text("Login")) ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                }, child: Container(child: Text("Sign Up")) ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreatePost()),
                  );
                }, child: Container(child: Text("Create Post")) ),
          ],
        )
      ),
    );
  }
}
