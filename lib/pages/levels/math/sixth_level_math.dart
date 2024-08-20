import 'package:flutter/material.dart';

class sixthMath extends StatefulWidget {
  @override
  State<sixthMath> createState() => _SecondMathState();
}

class _SecondMathState extends State<sixthMath> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();
  double  result = 0;

  @override
  void initState() {
    super.initState();
    firstNumberController.addListener(_updateResult);
    secondNumberController.addListener(_updateResult);
  }

  @override
  void dispose() {
    firstNumberController.dispose();
    secondNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 80,
                  color: Colors.transparent,
                  child: TextField(
                    controller: firstNumberController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center, // توسيط النص
                    style: TextStyle(
                      fontSize: 30, // حجم الخط
                      color: Color.fromRGBO(64, 123, 255, 1), // لون الخط
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey), // جعل البردر مخفياً
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent), // تغيير لون البردر عند الضغط
                      ),
                      labelText: '',
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'x',
                  style: TextStyle(fontSize: 30, color: Color.fromRGBO(64, 123, 255, 1)),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 80,
                  color: Colors.transparent,
                  child: TextField(
                    controller: secondNumberController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center, // توسيط النص
                    style: TextStyle(
                      fontSize: 30, // حجم الخط
                      color: Color.fromRGBO(64, 123, 255, 1), // لون الخط
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey), // جعل البردر مخفياً
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent), // تغيير لون البردر عند الضغط
                      ),
                      labelText: '',
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ),
                SizedBox(width: 10),

              ],
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '=',
                  style: TextStyle(fontSize: 40, color: Color.fromRGBO(64, 123, 255, 1)),
                ),
                SizedBox(width: 15),
                Text(
                  '$result',

                  style: TextStyle(fontSize: 30, color: Color.fromRGBO(64, 123, 255, 1)),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  void _updateResult() {
    double firstNumber = double.tryParse(firstNumberController.text) ?? 0;
    double secondNumber = double.tryParse(secondNumberController.text) ?? 0;
    setState(() {
      result = firstNumber * secondNumber;
    });
  }
}
