import 'package:flutter/material.dart';

enum Healthiness { obese, overWeight, normal, thin }

class Result extends StatelessWidget {
  const Result({
    super.key,
    required this.result,
    required this.isMale,
    required this.age,
  });

  final double result;
  final bool isMale;
  final int age;

  Healthiness get healthiness {
    if (result >= 18.5 && result <= 24.9) return Healthiness.normal;
    if (result > 25 && result < 30) return Healthiness.overWeight;
    if (result >= 30) return Healthiness.obese;
    return Healthiness.thin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text("Result"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Gender : ${isMale ? 'Male' : 'Female'}",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "Result : ${result.toStringAsFixed(1)}",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "Healthiness : $healthiness",
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                "Age : $age",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
