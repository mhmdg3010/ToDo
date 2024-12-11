import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/BMI_Result_Screen.dart';

class BmiScreen extends StatefulWidget {

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale =true;
  double height = 120;
  int age =40;
  int weight =90;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculaor',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          fontSize: 23,
          ),

        ),
        leading: Icon(Icons.calculate),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(()
                        {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isMale? Colors.blue : Colors.grey,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male,
                            size: 70,
                            ),
                            SizedBox(
                              height: 20,),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              )
                              ,)

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: !isMale? Colors.blue : Colors.grey,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female_sharp,
                              size: 70,
                            ),
                            SizedBox(
                              height: 20,),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              )
                              ,)

                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
            child:
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: Colors.grey,
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     'HEIGHT',
                     style: TextStyle(
                       fontSize: 40,
                       fontWeight: FontWeight.bold,
                     )
                     ,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                     children: [
                       Text(
                         '${height.round()}',
                         style: TextStyle(
                           fontSize: 40,
                           fontWeight: FontWeight.bold,
                         )
                         ,),
                       Text(
                         'CM',
                         style: TextStyle(
                           fontSize: 15,
                           fontWeight: FontWeight.bold,
                         )
                         ,),
                     ],
                   ),
                   Slider(
                       value: height,
                       min: 80,
                       max: 220,
                       onChanged: (value){
                         setState(() {
                           height =value;
                         });
                       })



                 ],
               ),
             ),
           )
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            )
                            ,),
                          Text(
                            '${age}',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            )
                            ,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children:
                            [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                              },
                                mini: true,
                                child: Icon(Icons.add),
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });

                                },
                                mini: true,
                                child: Icon(Icons.remove),
                              ),


                            ],)
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            )
                            ,),
                          Text(
                            '${weight}',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            )
                            ,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children:
                            [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });

                                },
                                mini: true,
                                child: Icon(Icons.add),
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });

                                },
                                mini: true,
                                child: Icon(Icons.remove),
                              ),


                            ],)
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),

          ),
          Container(
            width: double.infinity,
            color: Colors.grey,
            child: TextButton(
                onPressed: (){
                  double result =weight/ pow(height/100,2);
                  print(result.round());
                  
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=> BMI_Result(
                            isMale: isMale,
                            age: age,
                            result: result.round()),
                      ),
                      );
                },
                child: Text('Calculate',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
                )),
          )

        ],
      ),
    );
  }
}
