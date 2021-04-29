import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfileState createState() {
    return _ProfileState();
  }
}

// Create a reference to the users collection
CollectionReference userRef = FirebaseFirestore.instance.collection("users");

// Create a query against the collection.
Query query = userRef.where("id" == FirebaseAuth.instance.currentUser.uid);

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text("${data['firstName']} ${data['lastName']}", style: TextStyle(
              color: Colors.black, fontSize: 30));
        }

        return Text("loading");
      },
    );
  }
}

/*
DocumentReference docRef = FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid);
docRef.get().addOnCompleteListener(new OnCompleteListener<DocumentSnapshot>() {
  @Override
  public void onComplete(@NonNull Task<DocumentSnapshot> task) {
  if (task.isSuccessful()) {
  DocumentSnapshot document = task.getResult();
  if (document.exists()) {
  Log.d(TAG, "DocumentSnapshot data: " + document.getData());
  } else {
  Log.d(TAG, "No such document");
  }
  } else {
  Log.d(TAG, "get failed with ", task.getException());
  }
  }
});
 */




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
                          child: GetUserName(FirebaseAuth.instance.currentUser.uid)
                              ),
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
                                child: Text("Relationship:",
                                    style: TextStyle(color: Colors.black))),
                            Container(
                                alignment: Alignment.center,
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all()),
                                child: Text("Phone:",
                                    style: TextStyle(color: Colors.black))),
                            Container(
                                alignment: Alignment.center,
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all()),
                                child: Text("Date of Birth:",
                                    style: TextStyle(color: Colors.black))),
                            Container(
                                alignment: Alignment.center,
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all()),
                                child: Text("Job:",
                                    style: TextStyle(color: Colors.black))),
                            Container(
                                alignment: Alignment.center,
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all()),
                                child: Text(
                                  "Gender:",
                                  style: TextStyle(color: Colors.black),
                                )),
                            Container(
                                alignment: Alignment.center,
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all()),
                                child: Text("Location:",
                                    style: TextStyle(color: Colors.black))),
                          ])),
                    ]))));
  }
}
