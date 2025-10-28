import 'dart:math';

import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 170;
  double weight = 55;
  int age = 18;

  

  @override
  Widget build(BuildContext context) {
    var result = weight / pow(heightVal / 100, 2);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text("Body Mass Index"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m1Expanded(context, 'Male'),
                    const SizedBox(width: 15),
                    m1Expanded(context, 'Female'),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Height',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        heightVal.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(width: 5),
                      Text('cm', style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                  Slider(
                    value: heightVal,
                    min: 80,
                    max: 220,
                    activeColor: Colors.blueGrey,
                    inactiveColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        heightVal = value;
                      });
                    },
                  ),
                ],
              ),
            ),
           // const SizedBox(height: 5),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m2Expanded(context, 'Weight'),
                    const SizedBox(width: 15),
                    m2Expanded(context, 'age'),
                  ],
                ),
              ),
            ),
           
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.07,
              margin: EdgeInsets.all(10),
              child: TextButton(
                child: Text(
                  'Calculate',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Result(result: result, isMale: isMale, age: age),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isMale = (type == 'Male') ? true : false),
        child: Container(
          decoration: BoxDecoration(
            color: (isMale && type == 'Male') || (!isMale && type == 'Female')
                ? Colors.blueGrey
                : Colors.teal,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(type == 'Male' ? Icons.male : Icons.female, size: 90),
              const SizedBox(height: 15),
              Text(
                type == 'Male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,

          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 15),
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  backgroundColor: Colors.teal,
                  onPressed: () =>
                      setState(() => type == 'age' ? age-- : weight--),
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
                SizedBox(width: 8,),
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  backgroundColor: Colors.teal,
                  onPressed: () =>
                      setState(() => type == 'age' ? age++ : weight++),

                  mini: true,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
