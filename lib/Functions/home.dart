import 'package:AlwaysFirst/Functions/Required_movie.dart';
import 'package:AlwaysFirst/Functions/info.dart';
import 'package:AlwaysFirst/Functions/internet_speed.dart';
import 'package:AlwaysFirst/Functions/team.dart';
import 'package:flutter/material.dart';
import 'package:AlwaysFirst/movies/movies.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:wave/wave.dart';
import 'package:flutter_sinusoidals/flutter_sinusoidals.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const _colors = [
  Colors.brown,
  Colors.amber,
  Colors.teal,
  Colors.cyan,
  Colors.blue,
  Colors.grey
];

class _HomePageState extends State<HomePage> {
  static const _amplitude = 45.0;
  static const _waves = 3.0;
  static const _height = 200.0;
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
                child: ListTile(
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
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
              ListTile(
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
                  child: RaisedButton(
                    onPressed: () {},
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
