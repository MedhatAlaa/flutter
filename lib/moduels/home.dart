import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading:const Icon(
          Icons.menu,
        ),
        title:const Text(
          'First App',
        ),
        actions:
        [
          IconButton(
            onPressed:(){},
            icon: const Icon(
              Icons.notification_important,
            ),
          ),
          IconButton(
            onPressed:(){},
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body:const Text(
          'hello Medhat',
        style:TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
