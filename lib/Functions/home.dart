import 'dart:math';

import 'package:AlwaysFirst/Functions/Required_movie.dart';
import 'package:AlwaysFirst/Functions/info.dart';
import 'package:AlwaysFirst/Functions/internet_speed.dart';
import 'package:AlwaysFirst/Functions/qr_scanner.dart';
import 'package:AlwaysFirst/Functions/team.dart';
import 'package:flutter/material.dart';
import 'package:AlwaysFirst/movies/movies.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int r;
  List<Color> colors = [
    Colors.blueAccent[200],
    Colors.greenAccent[200],
    Colors.pinkAccent[100],
    Colors.redAccent[100],
    Colors.pinkAccent[100],
    Colors.purpleAccent[100],
    // Colors.deepPurpleAccent[100],
    //Colors.indigoAccent[100],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.blueAccent[100],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(5),
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Always First',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent[100],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    bottomLeft: Radius.circular(32),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        selectedTileColor: Colors.white,
                        // true,
                        leading: Icon(Icons.info),
                        title: Text(
                          'Info',
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InfoPage(),
                              ));
                        },
                      ),
                      //todo
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          selectedTileColor: Colors.white,
                          // true,
                          leading: Icon(Icons.group),
                          title: Text(
                            'Team',
                            style: TextStyle(fontSize: 18),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TeamPage(),
                                ));
                            // Update the state of the app.
                            // ...
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          selectedTileColor: Colors.white,
                          // true,
                          leading: Icon(Icons.qr_code),
                          title: Text(
                            'QR scanner',
                            style: TextStyle(fontSize: 18),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QRViewExample(),
                                ));
                            // Update the state of the app.
                            // ...
                          },
                        ),
                      ),
                      ListTile(
                        selectedTileColor: Colors.white,
                        // true,
                        leading: Icon(Icons.score),
                        title: Text(
                          'Ur internet speed',
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => interSpeed(),
                              ));
                        },
                      ),
                      ListTile(
                        // true,
                        selectedTileColor: Colors.white,
                        leading: Icon(Icons.movie),
                        title: Text(
                          'wish',
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Requiester(),
                              ));
                        },
                      ),
                      AboutListTile(
                        icon: Icon(
                          Icons.book,
                        ),
                        child: Text('About app'),
                        applicationIcon: Icon(
                          Icons.local_play,
                        ),
                        applicationName: 'AlwaysFirst',
                        applicationVersion: '1.0.3',
                        applicationLegalese: '© 2020 Company',
                        aboutBoxChildren: [
                          //Content goes here...
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 20.0, height: 100.0),
                    Text(
                      "Always",
                      style: TextStyle(fontSize: 43.0),
                    ),
                    SizedBox(width: 20.0, height: 100.0),
                    RotateAnimatedTextKit(
                      text: ["Be", "First"],
                      textStyle:
                          TextStyle(fontSize: 40.0, color: Colors.orange),
                    )
                  ],
                ),
                SizedBox(
                  height: 60,
                  width: 100,
                ),
                SizedBox(
                  height: 50.0,
                  width: 140.0,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    child: Text('Movies'),
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MoviesPage(),
                          ));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                SizedBox(
                  height: 50,
                  width: 140.0,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      Random rnd;
                      int min = 0;
                      int max = colors.length - 1;
                      rnd = new Random();
                      r = min + rnd.nextInt(max - min);
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext bc) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25)),
                                color: colors[r],
                              ),
                              height: 150,
                              child: Center(
                                child: Text(
                                  'from next update!',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          });
                    },
                    child: Text('Series'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
