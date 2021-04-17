import 'package:flutter/material.dart';
import 'constant.dart';
import 'function.dart';
import 'playButton.dart';
import 'dart:async';

class RandomPictures extends StatefulWidget {
  @override
  _RandomPicturesState createState() => _RandomPicturesState();
}

class _RandomPicturesState extends State<RandomPictures> {
  Color kRepeatColor = KInactiveIconColor;
  Color kShuffleColor = KInactiveIconColor;

  Timer timer;
  void startTimer() {
    Timer.periodic(
      Duration(seconds: 2),
      (timer) {
        if (selectedIcon == kPauseIcon) {
          setState(() {
            numberOfPhoto();
          });
        } else
          timer.cancel();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 500,
              child: Image.asset(
                'images/photo ($counter).jpg',
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        (kRepeatColor == KInactiveIconColor)
                            ? kRepeatColor = kActiveIconColor
                            : kRepeatColor = KInactiveIconColor;
                      });
                    },
                    color: kRepeatColor,
                    icon: Icon(kRepeatIcon)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        toast(message: 'You pressed previous ');
                        numberOfPhoto();
                      });
                    },
                    icon: Icon(kPreviousIcon),
                    color: KInactiveIconColor),
                PlayButton(
                  onPressed: () {
                    setState(() {
                      updateIcon();
                      startTimer();
                    });
                  },
                  childIcon: Icon(selectedIcon, color: kWhiteColor),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        toast(message: 'You pressed Next ');
                        numberOfPhoto();
                      });
                    },
                    icon: Icon(kNextIcon),
                    color: KInactiveIconColor),
                IconButton(
                    onPressed: () {
                      setState(() {
                        (kShuffleColor == KInactiveIconColor)
                            ? kShuffleColor = kActiveIconColor
                            : kShuffleColor = KInactiveIconColor;
                      });
                    },
                    icon: Icon(kShuffleIcon),
                    color: kShuffleColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
