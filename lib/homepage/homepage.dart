import 'package:flutter/material.dart';
import 'package:mediacenterflutter/auth/login.dart';
import 'package:mediacenterflutter/auth/signup.dart';

// home page State full widget
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
      backgroundColor: Colors.green[100],
      appBar: AppBar(title: Text('Media Center')),
      body: Center(
        child: Container(
            padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                      "Hello Welcome our App Please login or Sign up if you have't create an account yet! "),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 50.0),
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(6.0),
                          color: Colors.green,
                        ),
                        padding: EdgeInsets.only(left: 30, top: 5, bottom: 5),
                        child: Text(
                          "Log In",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ))),
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(6.0),
                    color: Colors.green,
                  ),
                  padding: EdgeInsets.only(left: 30, top: 5, bottom: 5),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Container(
                          child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ))),
                )
              ],
            )),
      ),
    );
  }
}
