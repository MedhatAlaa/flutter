import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BmiResult extends StatelessWidget {
  @override
  final int age;
  final int bmi;
  final bool gender;
   BmiResult({
    required this.age,
    required this.bmi,
    required this.gender,
});
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor:Colors.grey[800] ,
        elevation: 0.0,
        title:const Text(
          'BMI RESULT',
        ),
      ),
      body: Column(
        children:
        [
         const Center(
            child: Text(
                'YOUR RESULT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Text(
                      'Gender:  ${gender?'Male':'Female'} ',
                      style:const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                   const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'BMI:  $bmi',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'AGE:  $age',
                      style:const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20.0),
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.pink,
            child: MaterialButton(
              onPressed:()
              {
              },
              child:const Text(
                'RECALCULATE',
                style: TextStyle(
                  color: Colors.white,
                ),
              ) ,
            ),
          ),
        ],
      ),
    );
  }
}
