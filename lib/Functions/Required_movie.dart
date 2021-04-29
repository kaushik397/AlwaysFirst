import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controls.dart';

class Requiester extends StatefulWidget {
  Requiester({this.app});
  final FirebaseApp app;
  @override
  _RequiesterState createState() => _RequiesterState();
}

class _RequiesterState extends State<Requiester> {
  final movienom = " ";
  final refrenceDatabase = FirebaseDatabase.instance.reference();
  final movieController = TextEditingController();
  final typeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // String req = '';
    final ref = FirebaseDatabase.instance.reference();
    return Scaffold(
      appBar: AppBar(
        title: Text("Wish List!"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 200,
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: FlareActor(
                    "asserts/Teddy.flr",
                    shouldClip: false,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                height: 280,
                width: 800,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(25.0))),
                child: Center(
                  child: Column(
                    children: <Widget>[
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
                        height: 55,
                      ),
                      // ignore: deprecated_member_use
                      TextField(
                        controller: typeController,
                        decoration: InputDecoration(
                            hintText: "Type (optional)",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // ignore: deprecated_member_use
              Center(
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {
                    ref.push().set({
                      'Type_it': typeController.text,
                      "name": movieController.text
                    }).asStream();
                    typeController.clear();
                    movieController.clear();
                  },
                  child: Text('Submit type'),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
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
