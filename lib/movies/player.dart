import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//import 'package:AlwaysFirst/movies/movies.dart';
//import 'package:flutter/services.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class MoviePlayer extends StatefulWidget {
  List<dynamic> showdata;

  final int index;

  MoviePlayer(this.showdata, this.index);

  @override
  _MoviePlayerState createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<MoviePlayer> {
  @override
  void dispose() {
    print('turning portraitUp!!');
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Working Aa? :");
    print(widget.index);
    return WebviewScaffold(
      url: widget.showdata[widget.index]['link'],
    );
  }
}
