import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final _formKey = GlobalKey<FormState>();
  final commentController = TextEditingController();

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
                          MaterialPageRoute(
                              builder: (context) => signedInPage())
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
                  Container(
                    child: Column(
                      children: [
                        Form(
                            key: _formKey,
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 160.0,
                                  child: TextFormField(
                                    controller: commentController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'comment',
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Container(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        FirebaseFirestore.instance.collection(
                                            'comments').add({
                                          'userId': FirebaseAuth.instance
                                              .currentUser.uid,
                                          'postId': widget.postId,
                                          'comment': commentController.text,
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                            content: Text(
                                                'comment Successful!')));
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  signedInPage()),
                                        );
                                      }
                                    },
                                    child: Text("create comment"),
                                  ),
                                ),


                              ],
                            )

                        ),
                        Container(
                          child: _buildBody(context),
                        )
                      ],
                    ),
                  ),


                ],
              )
          ),
        )
    );
  }


// view comments

  _buildListItem(Map comment, List commentIds, int num) {
    return ListTile(
      title: GetUserName(comment["userId"]),
      subtitle: Text(comment["comment"]),
    );
  }

  _buildList(List<Map> comments, List commentIds) {
    List<ListTile> listTiles = [];
    int num = 0;
    for (Map comment in comments) {
      listTiles.add(_buildListItem(comment, commentIds, num));
      num++;
    }
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        ...listTiles,
      ],
    );
  }

  _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('comments')
            .where("postId", isEqualTo: widget.postId).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();

          List<Map> comments = [];
          List commentIds = [];
          for (DocumentSnapshot doc in snapshot.data.docs) {
            comments.add(doc.data());
            commentIds.add(doc.id);
          }
          return _buildList(comments, commentIds);
        }
    );
  }
}


