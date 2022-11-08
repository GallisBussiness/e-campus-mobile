
import 'package:audioplayers/audioplayers.dart';
import 'package:ecampus/models/Pub.dart';
import 'package:ecampus/pages/theme.dart';
import 'package:flutter/material.dart';

class AudioPub extends StatefulWidget {
  const AudioPub({super.key, required this.pub});
  final Pub pub;
  @override
  State<AudioPub> createState() => _AudioPubState();
}

class _AudioPubState extends State<AudioPub> {
  final audioPlayer = AudioPlayer();
   bool isPlaying = false;
   Duration duration = Duration.zero;
   Duration position = Duration.zero;

   @override
  void initState() {
    audioPlayer.onPlayerStateChanged.listen((event) { 
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });
    audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.pub.title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 4,),
             Text(
              widget.pub.description,
            style: const TextStyle(fontSize: 10)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: color2,
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow
                    ),
                    iconSize: 25,
                    color: Colors.white,
                    onPressed: () async {
                      if(isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        await audioPlayer.play(AssetSource(widget.pub.url));
                      }
                    },
                    ),
                ),
                const SizedBox(width: 5,),
                 Slider(
                  thumbColor: color2,
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
             onChanged: (v) async {
              final position = Duration(seconds: v.toInt());
              await audioPlayer.seek(position);
              await audioPlayer.resume();
             }),
              ],
            )
            ,
             Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             Text(formatTime(position)),
             ]),
             )
          ],
        ),
      ),
    );
  }
}



String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2,'0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final secons = twoDigits(duration.inSeconds.remainder(60));
  return [
    if(duration.inHours > 0) hours,
    minutes,
    secons,
  ].join(':');
}