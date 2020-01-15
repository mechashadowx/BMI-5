import 'package:flutter/material.dart';

class BmiScore extends StatelessWidget {
  final String bmi, health;
  final Color color;

  BmiScore({
    this.bmi,
    this.health,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  bmi,
                  style: TextStyle(
                    fontSize: data.size.width * 0.16,
                    color: color,
                  ),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  health,
                  style: TextStyle(
                    fontSize: data.size.width * 0.05,
                    color: color,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
