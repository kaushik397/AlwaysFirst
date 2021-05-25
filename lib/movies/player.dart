//import 'package:any_link_preview/web_analyzer.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//import 'package:AlwaysFirst/movies/movies.dart';
//import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class MoviePlayer extends StatefulWidget {
  final String link;

  final int index;

  MoviePlayer(this.link, this.index);

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
    return WebView(
      initialUrl: widget.link,
      
    );
  }
}
