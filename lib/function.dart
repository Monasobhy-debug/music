import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'constant.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void toast({String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: kGrayColor,
      textColor: kWhiteColor,
      fontSize: 16.0);
}

final audioPlayer = AudioPlayer();
final player = AudioCache(fixedPlayer: audioPlayer);
IconData selectedIcon = kPlayIcon;

void playMusic() {
  player.play('music1.mp3');
}

void stopMusic() {
  audioPlayer.stop();
}

void pauseMusic() {
  audioPlayer.pause();
}

void updateIcon() {
  (selectedIcon == kPlayIcon)
      ? selectedIcon = kPauseIcon
      : selectedIcon = kPlayIcon;
  (selectedIcon == kPlayIcon) ? pauseMusic() : playMusic();
} //updateIcon()

int counter = 1;
void numberOfPhoto() {
  counter++;
  if (counter == 13) counter = 1;
}
