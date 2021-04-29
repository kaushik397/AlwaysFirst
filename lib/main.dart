//import 'package:AlwaysFirst/movies/movies.dart';
import 'package:flutter/material.dart';
//simport 'package:flutter/services.dart';
import 'Functions/home.dart';
import 'package:splashscreen/splashscreen.dart';

//import 'package:flare_splash_screen/flare_splash_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlwaysFirst',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: HomePage(),
        backgroundColor: Colors.black,
        imageBackground: Image.asset('asserts/alwaysfirst1.png').image,
        loaderColor: Colors.black,
      ),
    );
  }
}
