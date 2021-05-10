import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediacenterflutter/post/viewPost.dart';
import 'package:mediacenterflutter/profile/people.dart';
import 'package:mediacenterflutter/profile/profile.dart';
import 'package:mediacenterflutter/post/createPost.dart';
import 'package:mediacenterflutter/auth/auth.dart';
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
      appBar: AppBar(
        title: Text('Welcome Back'),
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
            ),

        ],
        )
      ),
      body:  _buildBody(context),
    );
  }

  _buildListItem(Map post, List postIds, int num) {
    return ListTile(
      title: Text(post["title"]),
      subtitle: Text(post['desc']),
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ViewPost(postIds[num], post['title'], post['desc'], post['userId']))
        )
      },
    );
  }

  _buildList(List<Map> posts, List postIds) {
    List<ListTile> listTiles = [];
    int num = 0;
    for (Map post in posts) {
      listTiles.add(_buildListItem(post, postIds, num));
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
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        List<Map> posts = [];
        List postIds = [];
        for(DocumentSnapshot doc in snapshot.data.docs) {
          posts.add(doc.data());
          postIds.add(doc.id);
        }
        return _buildList(posts, postIds);
      }
    );
  }
}
