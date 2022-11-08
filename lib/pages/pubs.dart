import 'package:ecampus/audioplayer.dart';
import 'package:ecampus/models/Pub.dart';
import 'package:flutter/material.dart';

class Pubs extends StatelessWidget {
  Pubs({super.key});

  final List<Pub> pubs = [
    Pub(title: 'Titre 1',description: 'Description 1',imgUrl: 'images/ecampus.png',url: 'song.mp3'),
    Pub(title: 'Titre 2',description: 'Description 2',imgUrl: 'images/ecampus.png',url: 'song.mp3'),
    Pub(title: 'Titre 3',description: 'Description 3',imgUrl: 'images/ecampus.png',url: 'song.mp3'),
    Pub(title: 'Titre 4',description: 'Description 4',imgUrl: 'images/ecampus.png',url: 'song.mp3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: Colors.white,
      child: AudioPub(pub: pubs[0]));
  }
}