import 'package:flutter/material.dart';

class BMI_Result extends StatelessWidget {
final int age;
final bool isMale;
final int result;


BMI_Result({
    required this.age,
    required this.isMale,
    required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Result',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender : ${isMale ? 'Male' : 'Female'}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            ),
            Text('Age : $age',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text('Result : $result',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
