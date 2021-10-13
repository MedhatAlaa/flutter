
import 'dart:math';

import 'package:app/moduels/bmi_screens/bmi_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiScreens extends StatefulWidget {
  const BmiScreens({Key? key}) : super(key: key);

  @override
  _BmiScreensState createState() => _BmiScreensState();
}

class _BmiScreensState extends State<BmiScreens> {
  bool isMale=true;
  double height=120.0;
  int age=21;
  int weight=79;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor:Colors.grey[800] ,
        elevation: 0.0,
        title:const Text(
            'BMI CALCULATOR',
        ),
      ),
      body: Column(
        children:
        [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children:
                [
                  Expanded(
                    child: GestureDetector(
                      onTap: ()
                      {
                        setState(() {
                          isMale=true;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:const
                          [
                            Image(
                                image:AssetImage('assets/images/male.png'),
                              width: 70.0,
                              height: 70.0,
                              color: Colors.white,
                            ),
                             SizedBox(
                              height: 10.0,
                            ),
                             Text(
                              'Male',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 25.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10.0),
                          color:isMale?Colors.pink:Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: ()
                      {
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:const
                          [
                            Image(
                              image:AssetImage('assets/images/female2.png'),
                              width: 80.0,
                              height: 80.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 25.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10.0),
                          color:isMale? Colors.grey[700]:Colors.pink,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    const Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline:TextBaseline.alphabetic,
                      children:
                      [
                         Text(
                          '${height.round()}',
                          style:const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 40.0,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                        value:height,
                        max: 220.0,
                        min: 80.0,
                        activeColor: Colors.pink,
                        inactiveColor: Colors.grey[500],
                        onChanged:(value)
                        {
                          setState(() {
                            height=value;
                          });
                        } ,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10.0),
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children:
                [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          const Text(
                            'AGE',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                           Text(
                            '$age',
                            style:const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 30.0,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed:()
                                {
                                  setState(() {
                                    age--;
                                  });
                                },
                                heroTag: 'age-',
                                backgroundColor: Colors.grey[700],
                                mini: true,
                                child:const Icon(
                                    Icons.remove,
                                ),
                              ),
                              FloatingActionButton(
                                  onPressed:()
                                  {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                heroTag: 'age+',
                                backgroundColor:Colors.grey[700],
                                mini: true,
                                child:const Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10.0),
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          const Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                           Text(
                            '$weight',
                            style:const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 30.0,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed:()
                                {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                heroTag: 'weight-',
                                backgroundColor: Colors.grey[700],
                                mini: true,
                                child:const Icon(
                                    Icons.remove,
                                ),
                              ),
                              FloatingActionButton(
                                  onPressed:()
                                  {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                heroTag: 'weight+',
                                backgroundColor:Colors.grey[700],
                                mini: true,
                                child:const Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10.0),
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.pink,
            child: MaterialButton(
              onPressed:()
              {
                var result=weight/pow(height/100,2);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>BmiResult(
                      age:age,
                      bmi:result.round(),
                      gender:isMale,
                    ),),
                );
              },
              child:const Text(
                  'CALCULATE',
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
