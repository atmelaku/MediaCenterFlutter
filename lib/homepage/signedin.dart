import 'package:flutter/material.dart';
import 'package:mediacenterflutter/post/createPost.dart';

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
          child: Column(
            children: [
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
