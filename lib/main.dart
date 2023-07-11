import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

import 'misc/pinScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selected;
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
  ];
  List<Color> changedColors = [
    Colors.brown,
    Colors.orange,
    Colors.yellow,
  ];

  void buttonRecognizer(int buttonNumber) {
    setState(() {
        selected = buttonNumber;
        switch (buttonNumber){
          case 1:
            colors[0] = changedColors[Random().nextInt(3)];
          case 2:
          colors[1] = changedColors[Random().nextInt(3)];
        }
    });
  }
  int randomNumberGenerator(){
    Random random = Random();
    int randomNumber = random.nextInt(3);
    return randomNumber;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  width: 500,
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(4, 3),
                      ),
                    ],
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(88),
                  ),
                  child: const Center(
                    child: Text(
                      "Android",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 500,
                  height: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(4, 3),
                      ),
                    ],
                    color: Colors.deepPurple,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors[0], // Set the background color
                        ),
                        child: const Text(
                            "Pin Screen",
                        style: TextStyle(
                          color: Colors.white
                        ),

                        ),
                        onPressed: (){
                          buttonRecognizer(1);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const PinScreen()),
                            );
                        },
                      ),
                      SizedBox(width: 100),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: colors[1], // Set the background color
                        ),
                        child: const Text(
                          "Button 2",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                        onPressed: (){
                          buttonRecognizer(2);
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10), // Adding some spacing between containers
                Container(
                  width: 500,
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(4, 3),
                      ),
                    ],
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(88),
                  ),
                  child: Center(
                    child: new Text(
                      "Button - ${selected ?? ""} is selected",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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
