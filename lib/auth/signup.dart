
import 'package:flutter/material.dart';
import 'package:mediacenterflutter/auth/auth.dart';
import 'package:mediacenterflutter/auth/login.dart';

class SignUpPage extends StatefulWidget {


  @override
  _SignUpState createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUpPage> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String firstName = "";
  String lastName = "";
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
          title: Text('Register Page')),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "First Name",
                  fillColor: Colors.white,
                  filled: true,
                ),

                onChanged: (val) {
                  setState(() => firstName = val);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Last Name",
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (val) {
                  setState(() => lastName = val);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  fillColor: Colors.white,
                  filled: true,
                ),
                // check if the field is not empty  
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
                // check if the password char is loger than six char
                validator: (val) => val.length < 6 ? "Enter 6+ character " : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                color: Colors.red[400],
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                  ),

                ),
                onPressed: () async {
                  // if its validated we can register
                  if (_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(firstName, lastName, email, password);
                    // if result is  null meaning we are not able to register
                    if(result == null) {
                      setState(() {
                        error = "please enter a valid email";
                      });
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
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