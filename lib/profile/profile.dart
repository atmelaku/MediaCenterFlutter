import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfileState createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<ProfilePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.arrow_back),
              title: Text('Your Profile'),
              backgroundColor: Colors.orange,),
            floatingActionButton: FloatingActionButton(
              elevation: 10.0,
              child: Icon(Icons.edit),

            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: 0,
              fixedColor: Colors.teal,
              items: [BottomNavigationBarItem(
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
                ),],
            ),
            body: Container(
                decoration: BoxDecoration(color: Colors.orange),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(),
                      child: Text("FirstName LastName",
                          style: TextStyle(color: Colors.black, fontSize: 30))),
                  Container(
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children:[
                        Container(alignment: Alignment.center,
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all()),
                            child: Text("Relationship:",
                                style: TextStyle(color: Colors.black))),
                        Container(alignment: Alignment.center,
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all()),
                            child: Text("Phone:",
                                style: TextStyle(color: Colors.black))),
                        Container(alignment: Alignment.center,
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all()),
                            child: Text("Date of Birth:",
                                style: TextStyle(color: Colors.black))),
                        Container(alignment: Alignment.center,
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all()),
                            child: Text("Job:",
                                style: TextStyle(color: Colors.black))),
                        Container(
                            alignment: Alignment.center,
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all()),
                            child: Text(
                              "Gender:",
                              style: TextStyle(color: Colors.black),
                            )),
                        Container(alignment: Alignment.center,
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all()),
                            child: Text("Location:",
                                style: TextStyle(color: Colors.black))),
                      ])
                  ),

                ]))));
  }
}