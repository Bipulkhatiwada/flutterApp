import 'package:flutter/material.dart';
import 'dart:ui';

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
                  height: 300,
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
                      SizedBox(width: 10),
                      TextButton(
                        child: Text(
                          "Button 1",
                          style: TextStyle(
                              color: Colors.red,
                            backgroundColor: Colors.cyan
                          ),
                        ),
                        onPressed: (){
                          print("Button 1");
                        },
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Set the background color
                        ),
                        child: const Text(
                            "Button 2",
                        style: TextStyle(
                          color: Colors.green
                        ),

                        ),
                        onPressed: (){
                          print("Button 2");
                        },
                      ),
                      SizedBox(width: 10),
                      OutlinedButton(
                        child: const Text(
                          "Button 3",
                          style: TextStyle(
                              color: Colors.blue
                          ),
                        ),
                        onPressed: (){
                          print("Button 3");
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
                    child: Text(
                      "IOS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
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
