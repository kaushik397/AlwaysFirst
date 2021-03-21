import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Hi Guyes',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Hi Guyes',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Hi Guyes',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Hi Guyes',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Hi Guyes',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Hi Guyes',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Hi Guyes',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
