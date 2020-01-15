import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  final bool female;
  final Function changeGender;

  Gender({
    this.female,
    this.changeGender,
  });

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: data.size.width * 0.12),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                changeGender(false);
              },
              child: GenderStack(
                index: female ? 0 : 1,
                grayImage: 'assets/grayMale.png',
                redImage: 'assets/redMale.png',
                size: data.size.width * 0.2,
              ),
            ),
            GestureDetector(
              onTap: () {
                changeGender(true);
              },
              child: GenderStack(
                index: female ? 1 : 0,
                grayImage: 'assets/grayFemale.png',
                redImage: 'assets/redFemale.png',
                size: data.size.width * 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenderStack extends StatelessWidget {
  final int index;
  final double size;
  final String grayImage, redImage;

  GenderStack({
    this.index,
    this.size,
    this.grayImage,
    this.redImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: IndexedStack(
          index: index,
          children: <Widget>[
            Container(
              child: Center(
                child: Image.asset(
                  grayImage,
                  height: size,
                  width: size,
                ),
              ),
            ),
            Container(
              child: Center(
                child: Image.asset(
                  redImage,
                  height: size,
                  width: size,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
