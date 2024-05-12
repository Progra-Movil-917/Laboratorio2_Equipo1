import 'package:flutter/material.dart';

class Podcast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Podcast'),
      ),
      body: ReproductorPodcast(),
    );
  }
}

class ReproductorPodcast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 80,
          backgroundColor: Colors.grey[300],
          child: Icon(
            Icons.headset,
            size: 100,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Nombre del Podcast',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Descripción del episodio o podcast',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.skip_previous),
              iconSize: 40,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.play_arrow),
              iconSize: 60,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.skip_next),
              iconSize: 40,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
