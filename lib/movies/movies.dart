//import 'package:AlwaysFirst/Functions/loader.dart';
//import 'dart:js';

import 'package:AlwaysFirst/movies/player.dart';
import 'package:flutter/material.dart';
import 'package:AlwaysFirst/movies/dataFormat.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:any_link_preview/any_link_preview.dart';
//import 'package:path/path.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<MovieData> allMovies = [];
  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('movies').once().then((DataSnapshot snap) {
      var keys = snap.key;
      var data = snap.value;
      print("Data got is here");
      print('');
      print(data.length.runtimeType);
      allMovies.clear();
      for (int i = 0; i < data.length; i++) {
        MovieData d = MovieData(data[i]['index'], data[i]['link'],
            data[i]['name'], data[i]['type']);
        print('getting data!!!');
        allMovies.add(d);
      }
      print(allMovies[0].link);
      // print(data);
      setState(() {
        print('Length:${allMovies.length}');
      });
    });
    super.initState();
  }

//allMovies[index].name,
  @override
  Widget build(BuildContext context) {
    print('the recived adda:${allMovies.length}');
    return Scaffold(
      appBar: AppBar(
        title: Text("movies"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[100],
      ),
      body: Container(
          child: allMovies.length == 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                    ),
                    Center(
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                        child: Center(
                          child: SpinKitPumpingHeart(
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  //scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) {
                    return SingleChildScrollView(
                        child: Pusher(
                            allMovies[index].index,
                            allMovies[index].name,
                            allMovies[index].link,
                            allMovies[index].type));
                  },
                  itemCount: allMovies.length,
                )),
    );
  }
}

class Pusher extends StatefulWidget {
  final String name;
  final String link;
  final String type;
  final String index;
  Pusher(
    this.index,
    this.name,
    this.link,
    this.type,
  );
  @override
  _PusherState createState() => _PusherState();
}

class _PusherState extends State<Pusher> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
      child: Card(
        elevation: 3.0,
        shadowColor: Colors.black,
        child: ListTile(
          dense: true,
          //selected: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: AnyLinkPreview(
              link: widget.link,
              displayDirection: UIDirection.UIDirectionHorizontal,
              showMultimedia: false,
              cache: Duration(days: 7),
              backgroundColor: Colors.blueGrey[300],
              borderRadius: 2,
              removeElevation: false,
              boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey)],
              errorImage:
                  'https://www.pngkey.com/png/full/418-4187482_gray-color-full-screen.png',
            ),
          ),
          tileColor: Colors.blueGrey,
          selectedTileColor: Colors.blueGrey[100],
          title: Text(widget.name),
          subtitle: Text(widget.type),
          onTap: () {
            print(widget.name);
            print(widget.link);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MoviePlayer(widget.link, int.parse(widget.index)),
                ));
          },
        ),
      ),
    );
  }
}

/*leading: AnyLinkPreview(
          link: link,
          displayDirection: UIDirection.UIDirectionHorizontal,
          showMultimedia: false,
          cache: Duration(days: 7),
          backgroundColor: Colors.blueGrey[300],
          borderRadius: 2,
          removeElevation: false,
          boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey)],
          errorImage:
              'https://www.pngkey.com/png/full/418-4187482_gray-color-full-screen.png',
        ),
        Column(
      children: [
        Container(
          height: 140,
          width: 100,
          // color: Colors.blueAccent,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 20,
                  width: 20,
                  child: AnyLinkPreview(
                    link: widget.link,
                    displayDirection: UIDirection.UIDirectionHorizontal,
                    showMultimedia: false,
                    cache: Duration(days: 7),
                    backgroundColor: Colors.blueGrey[300],
                    borderRadius: 2,
                    removeElevation: false,
                    boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey)],
                    errorImage:
                        'https://www.pngkey.com/png/full/418-4187482_gray-color-full-screen.png',
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print(widget.link);
                },
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
        
        */
/* SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  //height: 30,
                  //width: 400,
                  child: allMovies.length == 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 200,
                            ),
                            Center(
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25.0))),
                                child: Center(
                                  child: SpinKitPumpingHeart(
                                    color: Colors.greenAccent,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : ListView.builder(
                          //scrollDirection: Axis.vertical,
                          itemBuilder: (_, index) {
                            return MovieLT(
                                allMovies[index].index,
                                allMovies[index].name,
                                allMovies[index].link,
                                allMovies[index].type);
                          },
                          itemCount: allMovies.length,
                        )),
            ],
          ),
        ),
      ),*/

// ignore: non_constant_identifier_names
/*Widget MovieLT(String index, String name, String link, String type) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
    child: Card(
      elevation: 1.0,
      shadowColor: Colors.grey,
      child: ListTile(
        dense: true,
        //selected: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.yellowAccent,
              borderRadius: BorderRadius.all(Radius.circular(3.0))),
          child: AnyLinkPreview(
            link: link,
            displayDirection: UIDirection.UIDirectionHorizontal,
            showMultimedia: false,
            cache: Duration(days: 7),
            backgroundColor: Colors.blueGrey[300],
            borderRadius: 2,
            removeElevation: false,
            boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey)],
            errorImage:
                'https://www.pngkey.com/png/full/418-4187482_gray-color-full-screen.png',
          ),
        ),
        tileColor: Colors.blueGrey,
        selectedTileColor: Colors.blueGrey[100],
        title: Text(name),
        subtitle: Text(type),
        onTap: () {},
      ),
    ),
  );
}
*/
