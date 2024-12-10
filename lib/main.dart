import 'package:flutter/material.dart';
import 'package:todo_app/Counter%20Screen.dart';
import 'package:todo_app/Users_Screen.dart';
import 'package:todo_app/login%20Screen.dart';
import 'package:todo_app/massenger_Screen.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      home: UsersScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

}






