import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: PinScreen(),
  ));
}

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreen();
}

class _PinScreen extends State<PinScreen> {

  var keyPadBtnWidth = 110.0;
  var keyPadBtnHeight = 80.0;

  var firstPinselected;
  var secondPinselected;
  var thirdPinselected;
  var fourthPinselected;

  List<int> pinNumber = [];
  List<Color> selectedUnselectedColor = [
    Colors.grey,
    Colors.white,
  ];
  void checkPin(int buttonNumber) {
    setState(() {
     if (pinNumber.length < 4){
       switch (pinNumber.length){
         case 0:
           firstPinselected = true;
         case 1:
           secondPinselected = true;
         case 2:
           thirdPinselected = true;
         case 3:
           fourthPinselected = true;
         default:
           break;
       }
       pinNumber.add(buttonNumber);
     } else{
       print("Pin OverFlowed");
     }
      });
  }
  void checkAfterDelete() {
    setState(() {
      pinNumber.removeLast();
      if (pinNumber.length < 4){
        switch (pinNumber.length){
          case 0:
            firstPinselected = false;
          case 1:
            secondPinselected = false;
          case 2:
            thirdPinselected = false;
          case 3:
            fourthPinselected = false;
          default:
            break;
        }
      } else{
        print("Enter Pin");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PIN'),
      ),
      body: Container(
        width: 500,
        height: 770,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
              width: 70,
              height: 70,
              child:Image.network('https://cdn-icons-png.flaticon.com/128/4438/4438755.png'),
            ),
           Container(
             padding: EdgeInsets.fromLTRB(9, 20, 8, 0),
               child:Text("Please enter your transaction PIN.",
                 style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.w700,
               ),
               ),
             ),
            Container(
             padding: EdgeInsets.fromLTRB(66, 40, 16, 25),
               child:Row(
                 children: [
                   Container(
                     padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                     child: Container(
                       width: 25,
                       height: 25,
                       decoration: BoxDecoration(
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(1),
                             spreadRadius: 0.2,
                             blurRadius: 1,
                             offset: Offset(0,0),
                           ),
                         ],
                         borderRadius: BorderRadius.circular(88),
                         color: (firstPinselected == true) ? selectedUnselectedColor[0] : selectedUnselectedColor[1],
                       ),
                     ),
                   ),
                   SizedBox(width: 30),
                   Container(
                     child: Container(
                       width: 25,
                       height: 25,
                       decoration: BoxDecoration(
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(1),
                             spreadRadius: 0.2,
                             blurRadius: 1,
                             offset: Offset(0,0),
                           ),
                         ],
                         borderRadius: BorderRadius.circular(88),
                         color: (secondPinselected == true) ? selectedUnselectedColor[0] : selectedUnselectedColor[1],
                       ),
                     ),

                   ),
                   SizedBox(width: 30),
                   Container(
                     child: Container(
                       width: 25,
                       height: 25,
                       decoration: BoxDecoration(
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(1),
                             spreadRadius: 0.2,
                             blurRadius: 1,
                             offset: Offset(0,0),
                           ),
                         ],
                         borderRadius: BorderRadius.circular(88),
                         color: (thirdPinselected == true) ? selectedUnselectedColor[0] : selectedUnselectedColor[1],
                       ),
                     ),

                   ),
                   SizedBox(width: 30),
                   Container(
                     child: Container(
                       width: 25,
                       height: 25,
                       decoration: BoxDecoration(
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(1),
                             spreadRadius: 0.2,
                             blurRadius: 1,
                             offset: Offset(0,0),
                           ),
                         ],
                         borderRadius: BorderRadius.circular(88),
                         color: (fourthPinselected == true) ? selectedUnselectedColor[0] : selectedUnselectedColor[1],
                       ),
                     ),

                   )
                 ],
               ),
               ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 90),
              child: Center(
                 child:TextButton(
                   onPressed: () {  
                     print("forget");
                   },
                   child: Text("Forgot your PIN?",
                   style: TextStyle(
                     fontSize: 16,
                     color: Colors.blueAccent,
                   ),
                   ),
                  )
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(9, 20, 8, 0),
              child: Row(
                children: [
                  Container(
                      width: keyPadBtnWidth,
                      height: keyPadBtnHeight,
                    child: OutlinedButton(
                          style: OutlinedButton.styleFrom( // Set the background color
                          ),
                          child: const Text(
                            "1",
                          ),
                          onPressed: (){
                            print(1);
                            checkPin(1);
                            print("pinNumber:${pinNumber} and length: ${pinNumber.length}");
                          },
                        )
                  ),
                  SizedBox(width: 30),
                  Container(
                      width: keyPadBtnWidth,
                      height: keyPadBtnHeight,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom( // Set the background color
                        ),
                        child: const Text(
                          "2",
                        ),
                        onPressed: (){
                          print(2);
                          checkPin(2);
                        print(pinNumber);
                        },
                      )
                  ),
                  SizedBox(width: 30),
                  Container(
                      width: keyPadBtnWidth,
                      height: keyPadBtnHeight,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom( // Set the background color
                        ),
                        child: const Text(
                          "3",
                        ),
                        onPressed: (){
                          print(3);
                          checkPin(3);
                        print(pinNumber);
                        },
                      )
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(9, 20, 8, 0),
              child: Row(
                children: [
                  Container(
                      width: keyPadBtnWidth,
                      height: keyPadBtnHeight,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom( // Set the background color
                        ),
                        child: const Text(
                          "4",
                        ),
                        onPressed: (){
                          print(4);
                          checkPin(4);
                        print(pinNumber);
                        },
                      )
                  ),
                  SizedBox(width: 30),
                  Container(
                      width: keyPadBtnWidth,
                      height: keyPadBtnHeight,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom( // Set the background color
                        ),
                        child: const Text(
                          "5",
                        ),
                        onPressed: (){
                          print(5);
                          checkPin(5);
                        print(pinNumber);
                        },
                      )
                  ),
                  SizedBox(width: 30),
                  Container(
                      width: keyPadBtnWidth,
                      height: keyPadBtnHeight,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom( // Set the background color
                        ),
                        child: const Text(
                          "6",
                        ),
                        onPressed: (){
                          print(6);
                          checkPin(6);
                        print(pinNumber);
                        },
                      )
                  ),
                ],
              ),
            ),Container(
              padding: EdgeInsets.fromLTRB(9, 20, 8, 0),
              child: Row(
                children: [
                  Container(
                      width: keyPadBtnWidth,
                      height: keyPadBtnHeight,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom( // Set the background color
                        ),
                        child: const Text(
                          "7",
                        ),
                        onPressed: (){
                          print(7);
                          checkPin(7);
                        print(pinNumber);
                        },
                      )
                  ),
                  SizedBox(width: 30),
                  Container(
                      width: keyPadBtnWidth,
                      height: keyPadBtnHeight,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom( // Set the background color
                        ),
                        child: const Text(
                          "8",
                        ),
                        onPressed: (){
                          print(8);
                          checkPin(8);
                        print(pinNumber);
                        },
                      )
                  ),
                  SizedBox(width: 30),
                  Container(
                      width: keyPadBtnWidth,
                      height: keyPadBtnHeight,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom( // Set the background color
                        ),
                        child: const Text(
                          "9",
                        ),
                        onPressed: (){
                          print(9);
                          checkPin(9);
                        print(pinNumber);
                        },
                      )
                  ),
                ],
              ),
            ),Container(
              padding: EdgeInsets.fromLTRB(9, 20, 8, 0),
              child: Row(
                children: [
                  Container(
                      width: keyPadBtnWidth,
                      height: keyPadBtnHeight,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,// Set the background color
                          foregroundColor:Colors.white,
                        ),
                        child: const Text(
                          "delete",
                        ),
                        onPressed: (){
                          print("delete");
                          checkAfterDelete();
                        print(pinNumber);
                        },
                      )
                  ),
                  SizedBox(width: 30),
                  Container(
                      width: keyPadBtnWidth,
                      height: keyPadBtnHeight,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom( // Set the background color
                        ),
                        child: const Text(
                          "0",
                        ),
                        onPressed: (){
                          print("0");
                          checkPin(0);
                        print(pinNumber);
                        },
                      )
                  ),
                  SizedBox(width: 30),
                  Container(
                      width: keyPadBtnWidth,
                      height: keyPadBtnHeight,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,// Set the background color
                          foregroundColor:Colors.white,// Set the foreground color
                        ),
                        child: const Text(
                          "Cancel",
                        ),
                        onPressed: (){ print(pinNumber);
                          print("Cancel");
                          Navigator.pop(context);
                        },
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SucessScreen extends StatelessWidget {
  const SucessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}