import 'package:bmi/helper.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final String height, weight;
  final Function changeHeight, changeWeight;

  Info({
    this.height,
    this.weight,
    this.changeHeight,
    this.changeWeight,
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
            Details(
              number: height,
              unit: 'Cm',
              change: changeHeight,
            ),
            Details(
              number: weight,
              unit: 'Kg',
              change: changeWeight,
            ),
          ],
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  final String number, unit;
  final Function change;

  Details({
    this.number,
    this.unit,
    this.change,
  });

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 5.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        change(1);
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Center(
                          child: Image.asset(
                            'assets/increase.png',
                            height: data.size.width * 0.02,
                            width: data.size.width * 0.04,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        change(-1);
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Center(
                          child: Image.asset(
                            'assets/decrease.png',
                            height: data.size.width * 0.02,
                            width: data.size.width * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  number,
                  style: TextStyle(
                    fontSize: data.size.width * 0.12,
                    color: gray,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Center(
                child: Text(
                  unit,
                  style: TextStyle(
                    fontSize: data.size.width * 0.06,
                    color: gray,
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
