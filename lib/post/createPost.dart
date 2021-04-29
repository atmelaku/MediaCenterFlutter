import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mediacenterflutter/homepage/signedin.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() {
    return _CreatePostState();
  }
}

class _CreatePostState extends State<CreatePost> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Post')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                icon: Icon(Icons.title),
                hintText: "What's your post about?",
                labelText: 'Title *',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: descController,
              decoration: const InputDecoration(
                icon: Icon(Icons.description),
                hintText: "What's on your mind?",
                labelText: 'Description *',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    FirebaseFirestore.instance.collection('posts').add({
                      'userId': FirebaseAuth.instance.currentUser.uid,
                     'title': titleController.text,
                     'desc': descController.text,
                    });
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Post Successful!')));
                    dispose();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signedInPage()),
                    );
                  }
                },
              child: Text("Create Post"),
            ),
          ],
        ),
      ),
    );
  }
}