
import 'package:flutter/material.dart';
import 'package:mediacenterflutter/auth/auth.dart';
import 'package:mediacenterflutter/homepage/signedin.dart';

class LoginPage extends StatefulWidget {


  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text field state
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],

      appBar: AppBar(
        backgroundColor: Colors.green[400],
          elevation: 0.0,
          title: Text('Login Page'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  fillColor: Colors.white,
                  filled: true,
                ),
                // check if the feild is not empty unless display an error 
                validator: (val) => val.isEmpty ? "Enter an email" : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                  fillColor: Colors.white,
                  filled: true,
                ),
                // check if the 
                obscureText: true,
                validator: (val) => val.length < 6 ? "Enter 6+ character " : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                color: Colors.red[400],
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.white,
                  ),

                ),
                onPressed: () async {
                  // if the current state is go ahead register if not diplay an error
                  if (_formKey.currentState.validate()){
                    print("valid");
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                        error = "please enter a valid email";
                      });
                    } 
                    else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signedInPage()),
                      );
                    }

                  }

                },
              ),
              SizedBox(height: 12),
              Text(error,
                style: TextStyle(
                  color: Colors.red, fontSize: 14.0,
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}