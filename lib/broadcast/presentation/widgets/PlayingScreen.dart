// features/broadcast/presentation/widgets/PlayingScreen.dart
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:rafeq/core/constansts/strings/broadcast.dart';
import 'package:rafeq/core/constansts/strings/context_extensions.dart';
import 'package:rafeq/core/shared/shared_widget/custom_app_bar_widget.dart';
import 'package:rafeq/broadcast/presentation/widgets/audio_info.dart';
import 'package:rafeq/utils/utils.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayingScreen extends StatefulWidget {
  const PlayingScreen({super.key});

  @override
  State<PlayingScreen> createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  bool isPlaying = true;
  late final AudioPlayer player;
  var au = [
    "audios/req_1.mp3",
    "audios/req_2.mp3",
    "audios/req_3.mp3",
    "audios/req_4.mp3",
    "audios/req_5.mp3",
    "audios/req_6.mp3",
    "audios/req_7.mp3",
    "audios/req_8.mp3",
  ];
  Duration _duration = const Duration();
  Duration _position = const Duration();

  @override
  void initState() {
    initPlayer();
    super.initState();
    player.play(AssetSource(au[r]));
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future initPlayer() async {
    player = AudioPlayer();
    player.play(AssetSource(au[r]));

    // set a callback for changing duration
    player.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });

    // set a callback for position change
    player.onPositionChanged.listen((Duration p) {
      setState(() => _position = p);
    });

    // set a callback for when audio ends
    
    player.onPlayerComplete.listen((_) {
      setState(() => _position = _duration);
    });
  }

  void playPause() async {
    if (isPlaying) {
      player.pause();
      isPlaying = false;
    } else {
      player.play(AssetSource(au[r]));
      isPlaying = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: context.propHeight(40),
          left: context.propWidth(20),
          right: context.propWidth(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomAppBar(),
              ],
            ),
            SizedBox(height: context.propHeight(30)),
            AudioInfo(),
            SizedBox(height: context.propHeight(50)),
            Slider(
              value: _position.inSeconds.toDouble(),
              onChanged: (value) async {
                await player.seek(Duration(seconds: value.toInt()));
                setState(() {});
              },
              min: 0,
              max: _duration.inSeconds.toDouble(),
              inactiveColor: Colors.grey,
              activeColor: Colors.red,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(_duration.format()),
              ],
            ),
             SizedBox(height: context.propHeight(50)  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (r == 0) {
                        r = bradcastTitile.length - 1;
                      } else {
                        r--;
                      }
                      setState(() {
                        isPlaying = true;
                        player.play(AssetSource(au[r]));
                      });
                    });
                  },
                  child: Container(
                    width: context.propWidth(40),
                    height: context.propHeight(40),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.skip_previous,
                        color: Colors.grey,
                       
                      ),
                    ),
                    
                  ),
                ),
            
                InkWell(
                  onTap: () {
                    player.seek(Duration(seconds: _position.inSeconds - 10));
                    setState(() {});
                  },
                  child: 
                  Container(
                    width: context.propWidth(40),
                    height: context.propHeight(40),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.replay_10_outlined,
                        color: Colors.grey,
                       
                      ),
                    ),
                    
                  ),
                ),
                 InkWell(
                     onTap: playPause,
                   child: Container(
                             width: context.propWidth(80),
                             height: context.propHeight(80),
                             decoration: ShapeDecoration(
                               color: Color(0xB2090909),
                               shape: CircleBorder(),
                             ),
                              child: Center(
                                child: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                  
                      ),
                              ),
                           ),
                 ),
               
               
              
                InkWell(
                  onTap: () {
                    player.seek(Duration(seconds: _position.inSeconds + 10));
                    setState(() {});
                  },
                  child:Container(
                    width: context.propWidth(40),
                    height: context.propHeight(40),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.forward_10_outlined,
                        color: Colors.grey,
                       
                      ),
                    ),
                    
                  ),
                ),
        
                InkWell(
                  onTap: () => {
                    if (r == bradcastTitile.length - 1)
                      {
                        r = 0,
                      }
                    else
                      {r = r + 1},
                    setState(() {
                      isPlaying = true;
                      player.play(AssetSource(au[r]));
                    })
                  },
                  child: Container(
                    width: context.propWidth(40),
                    height: context.propHeight(40),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.skip_next,
                        color: Colors.grey,
                       
                      ),
                    ),
                    
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}