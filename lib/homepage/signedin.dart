import 'package:flutter/material.dart';
import 'package:mediacenterflutter/auth/auth.dart';
import 'package:mediacenterflutter/models/user_list.dart';
import 'homepage.dart';

class signedInPage extends StatefulWidget {
  @override
  _signedInState createState() {
    return _signedInState();
  }
}

class _signedInState extends State<signedInPage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Welcome Back'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person,),
            label: Container(
              child: ElevatedButton(
                child: Text(
                    "Log out"
                ),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ),
            onPressed: () async{
              await _auth.signOut();

            },

          ),

        ],

      ),
      body: Container(
        child: Text("welcome"),
      ),
      );
  }
}
