import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Requiester extends StatefulWidget {
  Requiester({this.app});
  final FirebaseApp app;
  @override
  _RequiesterState createState() => _RequiesterState();
}

class _RequiesterState extends State<Requiester> {
  final movienom = "What You wish to watch Here";
  final refrenceDatabase = FirebaseDatabase.instance;
  final movieController = TextEditingController();
  final typeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ref = refrenceDatabase.reference();
    return Scaffold(
      appBar: AppBar(
        title: Text("Wish's"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                movienom,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: movieController,
                decoration: InputDecoration(
                    hintText: "Name",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.grey))),
              ),
              SizedBox(
                height: 25,
              ),
              FlatButton(
                onPressed: () {
                  ref
                      .push()
                      .child('Name_it')
                      .set(movieController.text)
                      .asStream();
                  movieController.clear();
                },
                child: Text('Submit Name'),
                color: Colors.blue,
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                    hintText: "Type",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.grey))),
              ),
              SizedBox(
                height: 25,
              ),
              FlatButton(
                onPressed: () {
                  ref
                      .push()
                      .child('Type_it')
                      .set(typeController.text)
                      .asStream();
                  typeController.clear();
                },
                child: Text('Submit type'),
                color: Colors.blue,
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
