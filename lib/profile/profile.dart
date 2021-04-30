import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mediacenterflutter/models/profile.dart';
import 'editprofile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfileState createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser.uid);
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.arrow_back),
              title: Text('Your Profile'),
              backgroundColor: Colors.orange,
            ),
            floatingActionButton: FloatingActionButton(
              elevation: 10.0,
              child: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: 0,
              fixedColor: Colors.teal,
              items: [
                BottomNavigationBarItem(
                  title: Text("Home"),
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  title: Text("Posts"),
                  icon: Icon(Icons.post_add),
                ),
                BottomNavigationBarItem(
                  title: Text("Add"),
                  icon: Icon(Icons.add_box),
                ),
              ],
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
                                child: GetRelationship(
                                    FirebaseAuth.instance.currentUser.uid)),
                            Container(
                                alignment: Alignment.center,
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all()),
                                child: GetPhone(
                                    FirebaseAuth.instance.currentUser.uid)),
                            Container(
                                alignment: Alignment.center,
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all()),
                                child: GetDOB(
                                    FirebaseAuth.instance.currentUser.uid)),
                            Container(
                                alignment: Alignment.center,
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all()),
                                child: GetJob(
                                    FirebaseAuth.instance.currentUser.uid)),
                            Container(
                                alignment: Alignment.center,
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all()),
                                child: GetGender(
                                    FirebaseAuth.instance.currentUser.uid)),
                            Container(
                                alignment: Alignment.center,
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all()),
                                child: GetLocation(
                                    FirebaseAuth.instance.currentUser.uid)),
                          ])),
                    ]))));
  }
}
