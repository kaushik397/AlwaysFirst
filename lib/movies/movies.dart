import 'dart:io';
import 'package:badges/badges.dart';
import 'package:AlwaysFirst/movies/player.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  // SearchBar searchBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("movies"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent[100],
        ),
        body: Center(
          child: FutureBuilder(
            builder: (contenxt, snapshot) {
              var showData = json.decode(snapshot.data.toString());
              print(showData.runtimeType);
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    selected: true,
                    // leading: ImageBuilder(showData[index]['link']),
                    title: Text(
                      showData[index]['name'],
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w100),
                    ),
                    subtitle: Text(
                      'Type: ' + showData[index]['type'],
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    onLongPress: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext bc) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25)),
                                  color: Colors.white),

                              height: 200,
                              //color: Colors.white,
                              child: ListView(
                                padding: EdgeInsets.all(5),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      showData[index]['name'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.share,
                                      color: Colors.black,
                                    ),
                                    title: Text('Share',
                                        style: TextStyle(
                                          color: Colors.black,
                                        )),
                                    //tileColor: Colors.lightGreenAccent[200],
                                    onTap: () {
                                      Share.share(showData[index]['link']);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.play_arrow,
                                      color: Colors.black,
                                    ),
                                    title: Text('Watch Now',
                                        style: TextStyle(
                                          color: Colors.black,
                                        )),
                                    //tileColor: Colors.pinkAccent[100],
                                    onTap: () {
                                      SystemChrome.setPreferredOrientations(
                                          [DeviceOrientation.landscapeLeft]);
                                      debugPrint("hi-men");
                                      // print('the debug' + showData['name']);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MoviePlayer(
                                              showData,
                                              index,
                                            ),
                                          ));
                                    },
                                  ),
                                ],
                              ),
                            );
                          });
                      //Share.share(showData[index]['link']);
                    },
                    onTap: () {
                      SystemChrome.setPreferredOrientations(
                          [DeviceOrientation.landscapeLeft]);
                      debugPrint("hi-men");
                      // print('the debug' + showData['name']);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MoviePlayer(
                              showData,
                              index,
                            ),
                          ));
                    },
                  );
                },
                itemCount: showData.length,
              );
            },
            future: DefaultAssetBundle.of(context)
                .loadString("asserts/AlwaysFirst.json"),
          ),
        ));
  }
}

// ignore: non_constant_identifier_names
/*ImageBuilder(String link) {
  return FlutterLinkPreview(
    url: link,
    //key: ValueKey(''),
    builder: (link) {
      if (link == null) return const SizedBox();
      if (link is WebImageInfo) {
        return CachedNetworkImage();
      }
    },
  );
}
*/
