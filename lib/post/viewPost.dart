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
        body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(20),
              padding: EdgeInsets.only(left: 10),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blue[100],
              ),
              child: Column(
                children: [

                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 70,
                           child:  Image.network('https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png')
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 0, top: 30),
                          alignment: Alignment.centerLeft,
                          decoration: new BoxDecoration(

                          ),
                          child: GetUserName(widget.userId,
                          ),
                        ),

                      ],
                    ),
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 0),
                    child:  Text(widget.postTitle,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,

                        )),
                  ),
                 Container(
                   alignment: Alignment.centerLeft,
                   child: Text(widget.postDesc,
                       style: TextStyle(
                         fontSize: 20,
                       )
                   ),
                 ),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Form(

                            key: _formKey,
                            child: Row(
                              children: [

                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  height: 35,
                                  width: 200.0,
                                  child: TextFormField(
                                    controller: commentController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)
                                      ),
                                      labelText: 'leave a comment',


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

                                  margin: EdgeInsets.only(left: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.purple,
                                    ),
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
                                    child: Text("post"),
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
        )  ),
    );
  }


// view comments

  _buildListItem(Map comment, List commentIds, int num) {
    return ListTile(

      title: Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Container(height: 50,
                width: 50,
                child:  Image.network('https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png')
            ),

            Container(
              child: GetUserName(comment["userId"]),
            ),

          ],
        ),
      ),
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


