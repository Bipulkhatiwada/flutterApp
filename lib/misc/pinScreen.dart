import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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

  var keyPadBtnWidth = 100.0.w;
  var keyPadBtnHeight = 50.0.h;
  var pin = "1111";

  var firstPinselected = false;
  var secondPinselected = false;
  var thirdPinselected = false;
  var fourthPinselected = false;
  var globalSelection = false;

  List<int> pinNumber = [];
  List<Color> selectedUnselectedColor = [
    Colors.grey,
    Colors.white,
  ];


  Widget getNumPad({required int padNum, required bool numpadSelection}){
    return  SizedBox(
          width: keyPadBtnWidth,
          height: keyPadBtnHeight,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom( // Set the background color
            ),
            child:  Text(
              "${padNum}",
            ),
            onPressed: (){
              print(padNum);
              checkPin(padNum,numpadSelection);
              print("pinNumber:${pinNumber} and length: ${pinNumber.length}");
            },
          )

    );
  }
  void checkPin(int buttonNumber,bool selection) {
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
       if (pinNumber.join() == pin){
         Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => const SucessScreen()),
         );
       }
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 8.h, 0),
                width: 70.w,
                height: 70.h,
                child:Image.network('https://cdn-icons-png.flaticon.com/128/4438/4438755.png'),
              ),
             Container(
               padding: EdgeInsets.fromLTRB(0.w, 20.h, 0.h, 30.h),
                 child:const Text("Please enter your transaction PIN.",
                   style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.w700,
                 ),
                 ),
               ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        spreadRadius: 0.2,
                        blurRadius: 1,
                        offset: Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(88),
                    color: firstPinselected ?  selectedUnselectedColor[0] : selectedUnselectedColor[1],
                  ),
                ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            spreadRadius: 0.2,
                            blurRadius: 1,
                            offset: Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(88),
                        color:  secondPinselected ?  selectedUnselectedColor[0] : selectedUnselectedColor[1],
                      ),
                    ),  Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            spreadRadius: 0.2,
                            blurRadius: 1,
                            offset: Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(88),
                        color: thirdPinselected ?  selectedUnselectedColor[0] : selectedUnselectedColor[1],
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            spreadRadius: 0.2,
                            blurRadius: 1,
                            offset: Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(88),
                        color: fourthPinselected ?  selectedUnselectedColor[0] : selectedUnselectedColor[1],
                      ),
                    ),
                  ],
                ),
              ),


              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 20.h, 0, 30.h),
                  child: Center(
                     child:TextButton(
                       onPressed: () {
                         print("forget");
                       },
                       child: const Text("Forgot your PIN?",
                       style: TextStyle(
                         fontSize: 16,
                         color: Colors.blueAccent,
                       ),
                       ),
                      )
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(9.w, 10.h, 0.w, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getNumPad(padNum: 1,numpadSelection: true),
                      SizedBox(width: 10.h),
                      getNumPad(padNum: 2,numpadSelection: true),
                      SizedBox(width: 10.h),
                      getNumPad(padNum: 3,numpadSelection: true),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(9.w, 10.h, 0.w, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getNumPad(padNum: 4,numpadSelection: true),
                      SizedBox(width: 10.h),
                      getNumPad(padNum: 5,numpadSelection: true),
                      SizedBox(width: 10.h),
                      getNumPad(padNum: 6,numpadSelection: true),
                    ],
                  ),
                ),
              ),Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(9.w, 10.h, 0.w, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getNumPad(padNum: 7,numpadSelection: true),
                      SizedBox(width: 10.h),
                      getNumPad(padNum: 8,numpadSelection: true),
                      SizedBox(width: 10.h),
                      getNumPad(padNum: 9,numpadSelection: true),
                    ],
                  ),
                ),
              ),Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(9.w, 10.h, 0.w, 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     SizedBox(
                      width: keyPadBtnWidth,
                      height: keyPadBtnHeight,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom( // Set the background color
                        ),
                        child:  Text(
                          "Delete",
                        ),
                        onPressed: (){
                          checkAfterDelete();
                        },
                      ),
                     ),
                      SizedBox(width: 10.h),
                      getNumPad(padNum: 0,numpadSelection: true),
                      SizedBox(width: 10.h),
                      SizedBox(
                        width: keyPadBtnWidth,
                        height: keyPadBtnHeight,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom( // Set the background color
                          ),
                          child:  Text(
                            "Cancel",
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
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
        title: const Text('Sucess'),
      ),
      body: Container(
        child:Column(
          children: [
            
            Center(
              child: Center(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Go back!'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Correct Pin"),
          ],
        )

      ),
    );
  }
}