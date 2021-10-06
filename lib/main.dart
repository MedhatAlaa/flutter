import 'package:app/moduels/home.dart';
import 'package:app/moduels/users_screen.dart';
import 'package:flutter/material.dart';

import 'moduels/messenger_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessengerScreen(),
    );
  }

}

