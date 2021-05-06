import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediacenterflutter/homepage/homepage.dart';
import 'package:mediacenterflutter/homepage/signedin.dart';
import 'package:mediacenterflutter/profile/profile.dart';
import 'package:mediacenterflutter/post/createPost.dart';
import 'package:mediacenterflutter/auth/auth.dart';
import 'package:mediacenterflutter/profile/viewprofile.dart';

class PeoplePage extends StatefulWidget {
  @override
  _PeopleState createState() {
    return _PeopleState();
  }
}

class _PeopleState extends State<PeoplePage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('People'),
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
      body:  _buildBody(context),
    );
  }

  _buildListItem(Map person, List profile, int num) {
    return ListTile(
      title: Text(person["firstName"] + " " + person["lastName"]),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ViewProfilePage(profile[num])),
        );
      },
    );
  }

  _buildList(List<Map> people, List profile) {
    List<ListTile> listTiles = [];
    int num = 0;
    for (Map person in people) {
      listTiles.add(_buildListItem(person, profile, num));
      num++;
    }
    return ListView(
      children: <Widget>[
        ...listTiles,
      ],
    );
  }

  _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();

          List<Map> people = [];
          List profile = [];
          for(DocumentSnapshot doc in snapshot.data.docs) {
            people.add(doc.data());
            profile.add(doc.id);
          }
          return _buildList(people, profile);
        }
    );
  }
}
