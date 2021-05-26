import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ConfettiAnimationBlast extends StatefulWidget {
  @override
  _ConfettiAnimationBlastState createState() => _ConfettiAnimationBlastState();
}

class _ConfettiAnimationBlastState extends State<ConfettiAnimationBlast> {
  ConfettiController _controllerBottom;

  @override
  void initState() {
    _controllerBottom =
        ConfettiController(duration: const Duration(seconds: 20));
    super.initState();
  }

  @override
  void dispose() {
    _controllerBottom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final assetsAudioPlayer = AssetsAudioPlayer();

    List<String> _listOfImages = [
      // 'assets/images/img1.jpg',
      // 'assets/images/img2.jpg',
      // 'assets/images/img3.jpg',
      // 'assets/images/img4.jpg',
      // 'assets/images/img5.jpg',
      // 'assets/images/img6.jpg',
      // 'assets/images/img7.jpg',
      // 'assets/images/img8.jpg',
      // 'assets/images/we.jpg',
      // 'assets/images/us.png',
      // 'assets/images/love.mp4',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.red]),
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Swiper(
                      onTap: (index) {
                        Fluttertoast.showToast(
                            msg: "Congrats",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.redAccent,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      duration: 10,
                      autoplay: true,
                      itemHeight: 350,
                      itemWidth: 300,
                      // pagination: SwiperPagination(),
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          alignment: Alignment.center,
                          height: 500,
                          width: 500,
                          child: Image.asset(
                            '${_listOfImages[index]}',
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                      layout: SwiperLayout.CUSTOM,
                      customLayoutOption:
                          new CustomLayoutOption(startIndex: -1, stateCount: 3)
                              .addRotate(
                                  [-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
                        new Offset(-370.0, -40.0),
                        new Offset(0.0, 0.0),
                        new Offset(370.0, -40.0)
                      ]),
                      viewportFraction: 0.8,
                      scale: 0.9,
                      itemCount: 10),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Align(
                heightFactor: 5.0,
                alignment: Alignment.bottomCenter,
                child: ConfettiWidget(
                    confettiController: _controllerBottom,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: true,
                    colors: [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.lime,
                      Colors.teal,
                      Colors.grey,
                      Colors.orange,
                      Colors.purple,
                      Colors.red
                    ],
                    blastDirection: -pi / 2,
                    emissionFrequency: 0.01,
                    numberOfParticles: 100,
                    maxBlastForce: 100,
                    minBlastForce: 80,
                    gravity: 0.3),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  onPressed: () {
                    _controllerBottom.play();
                  },
                  child: Text("Happy Birthday")),
            ),
            // Align(
            //     alignment: Alignment.center,
            //     child: NeumorphicButton(
            //       onPressed: () {
            //         AssetsAudioPlayer.playAndForget(
            //             Audio("assets/music/Happy_Birthday_Song.mp3"));
            //       },
            //     )),
          ],
        ),
      ),
    );
  }
}
