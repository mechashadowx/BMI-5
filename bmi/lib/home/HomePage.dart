import 'package:bmi/helper.dart';
import 'package:flutter/material.dart';
import 'BmiScore.dart';
import 'Gender.dart';
import 'Info.dart';
import 'Splitter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double bmi;
  String health;
  bool female;
  int height, weight;

  @override
  void initState() {
    super.initState();
    female = true;
    height = 180;
    weight = 70;
    calculate();
  }

  changeGender(bool g) {
    if (g == female) return;
    setState(() {
      female = !female;
    });
  }

  changeHeight(int x) {
    setState(() {
      height += x;
      if (height == 0) height++;
    });
  }

  changeWeight(int x) {
    setState(() {
      weight += x;
      if (weight == 0) weight++;
    });
  }

  calculate() {
    setState(() {
      double h = height.toDouble() / 100;
      bmi = weight.toDouble() / (h * h);
      if (bmi < 16) {
        health = 'Severe Thinness';
      } else if (bmi >= 16 && bmi < 17) {
        health = 'Moderate Thinness';
      } else if (bmi >= 17 && bmi < 18.5) {
        health = 'Mild Thinness';
      } else if (bmi >= 18.5 && bmi < 25) {
        health = 'Normal';
      } else if (bmi >= 25 && bmi < 30) {
        health = 'Overweight';
      } else if (bmi >= 30 && bmi < 35) {
        health = 'Obese Class I';
      } else if (bmi >= 35 && bmi <= 40) {
        health = 'Obese Class II';
      } else {
        health = 'Obese Class III';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: black,
      body: Container(
        margin: EdgeInsets.only(
            top: data.size.height * 0.05, bottom: data.size.height * 0.1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BmiScore(
                bmi: bmi.toString().substring(0, 4),
                health: health,
                color: gray,
              ),
              Splitter(
                height: 1,
                width: data.size.width * 0.85,
                color: gray,
              ),
              Gender(
                female: female,
                changeGender: changeGender,
              ),
              Splitter(
                height: 1,
                width: data.size.width * 0.85,
                color: gray,
              ),
              Info(
                height: height.toString(),
                weight: weight.toString(),
                changeHeight: changeHeight,
                changeWeight: changeWeight,
              ),
              GestureDetector(
                onTap: calculate,
                child: Container(
                  width: data.size.width * 0.7,
                  margin: EdgeInsets.only(top: data.size.height * 0.15),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(data.size.width * 0.07),
                  ),
                  child: Center(
                    child: Text(
                      'Calculate Your BMI',
                      style: TextStyle(
                        fontSize: data.size.width * 0.07,
                        color: black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
