import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'constant.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'dart:async';
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
  startTimer();
  (selectedIcon == kPlayIcon)
      ? selectedIcon = kPauseIcon
      : selectedIcon = kPlayIcon;
  (selectedIcon == kPlayIcon) ? pauseMusic() : playMusic();
} //updateIcon()

void startTimer() {
  Timer(Duration(milliseconds: 10), randomNumber);
}

int number = 1;
void randomNumber() {
  int n = number;
  number = Random().nextInt(4) + 1;
  while (n == number) {
    number = Random().nextInt(4) + 1;
  }
}
//randomNumber()
