import 'package:flutter/material.dart';
import 'constant.dart';
import 'function.dart';
import 'playButton.dart';

class RandomPictures extends StatefulWidget {
  @override
  _RandomPicturesState createState() => _RandomPicturesState();
}

class _RandomPicturesState extends State<RandomPictures> {
  Color kRepeatColor = KInactiveIconColor;
  Color kShuffleColor = KInactiveIconColor;

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
                'images/photo ($number).jpg',
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
                        randomNumber();
                      });
                    },
                    icon: Icon(kPreviousIcon),
                    color: KInactiveIconColor),
                PlayButton(
                  onPressed: () {
                    setState(() {
                      updateIcon();
                      startTimer();
                      // playMusic();
                    });
                  },
                  childIcon: Icon(selectedIcon, color: kWhiteColor),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        toast(message: 'You pressed Next ');
                        randomNumber();
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
