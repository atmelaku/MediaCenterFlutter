import 'package:flutter/material.dart';
import 'package:mediacenterflutter/profile/profile.dart';

class signedInPage extends StatefulWidget {
  @override
  _signedInState createState() {
    return _signedInState();
  }
}

class _signedInState extends State<signedInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Back')),
      body: Container(
          child: Container( child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              }, child: Container(child: Text("Profile")) )
          )
      ),
    );
  }
}
