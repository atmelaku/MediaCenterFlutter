import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mediacenterflutter/auth/auth.dart';
import 'package:mediacenterflutter/homepage/homepage.dart';
import 'package:mediacenterflutter/homepage/signedin.dart';
import 'package:mediacenterflutter/models/profile.dart';
import 'package:mediacenterflutter/post/createPost.dart';
import 'package:mediacenterflutter/profile/people.dart';
import 'package:mediacenterflutter/profile/profile.dart';

class ViewProfilePage extends StatefulWidget {
  final String profileID;
  ViewProfilePage(this.profileID);

  @override
  _ViewProfileState createState() {
    return _ViewProfileState();
  }
}

class _ViewProfileState extends State<ViewProfilePage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser.uid);
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Profile'),
              backgroundColor: Colors.orange,
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: Container(
                    child: ElevatedButton(
                      child: Text("Log out"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    ),
                  ),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                ),
              ],
            ),
            drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Container(
                      height: 80,
                      child: DrawerHeader(
                        child: Text('Options'),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    ListTile(
                        leading: Icon(Icons.home),
                        title: Text('Homepage'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => signedInPage())
                          );
                        }
                    ),
                    ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Profile'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProfilePage())
                          );
                        }
                    ),
                    ListTile(
                        leading: Icon(Icons.person),
                        title: Text('People'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PeoplePage())
                          );
                        }
                    ),
                    ListTile(
                        leading: Icon(Icons.post_add),
                        title: Text('Create New Post'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CreatePost())
                          );
                        }
                    )
                  ],
                )
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
                              widget.profileID)),
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
                                    child: GetRelationship(
                                        widget.profileID)),
                                Container(
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: GetPhone(
                                        widget.profileID)),
                                Container(
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: GetDOB(
                                        widget.profileID)),
                                Container(
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: GetJob(
                                        widget.profileID)),
                                Container(
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: GetGender(
                                        widget.profileID)),
                                Container(
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: GetLocation(
                                        widget.profileID)),
                              ])),
                    ]))));
  }
}
