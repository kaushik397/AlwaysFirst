import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_icons/flutter_icons.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    Future _speak() async {
      await flutterTts.setLanguage("hi-In");
      print(await flutterTts.getVoices);
      await flutterTts.setPitch(1.0);
      await flutterTts.setSpeechRate(0.8);

      await flutterTts.speak(
          "We at alwaysFirst Don't take any information from user , but for our service we use hosting platforms and google admob for other ads you see, Entire app is made using flutter frame work ,they are updated mostly manually and they don't contain any virus and it is recommended to clear cache from app manager.");
    }

    @override
    void dispose() {
      flutterTts.stop();
      super.dispose();
      // widget.aud.setVolume(upvol);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Info Page"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        child: Icon(Icons.volume_up),
        tooltip: 'Hear Me',
        onPressed: () => _speak(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "We at alwaysFirst Don't take any information from user , but for our service we use hosting platforms and google admob for other ads you see, Entire app is made using flutter frame work ,they are updated mostly manually and they don't contain any virus and it is recommended to clear cache from app manager. ",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'To use:\n 1. if any ads popup kindly restart the app ads will disappear,\n 2. if any app fails in orientation restart the app,\n 3. if any other failures kindly contact the admin to fix the app. ',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
