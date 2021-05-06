import 'package:flutter/material.dart';
import 'package:mediacenterflutter/homepage/signedin.dart';
import 'package:mediacenterflutter/post/createPost.dart';
import 'package:mediacenterflutter/profile/profile.dart';
import 'package:mediacenterflutter/models/profile.dart';

class ViewPost extends StatefulWidget {
  final String postId;
  final String postTitle;
  final String postDesc;
  final String userId;
  ViewPost(this.postId, this.postTitle, this.postDesc, this.userId);



  @override
  _ViewPostState createState() {
    return _ViewPostState();
  }
}

class _ViewPostState extends State<ViewPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Viewing Post")
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
      body: Center(
        child: Container(
          child: Column(
            children: [
              GetUserName(widget.userId),
              Text(widget.postTitle,
              style: TextStyle(
                fontSize: 30,
              )),
              Text(widget.postDesc,
              style: TextStyle(
                fontSize: 25,
              )
              ),
            ],
          )
        ),
      )
    );
  }

}
