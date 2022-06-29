import 'dart:math';

import 'package:flutter/material.dart';

import '../bmi_sesult/bmi_result.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale =true;
  double height = 100;
  int age =15;
  int weight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bmi calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale =true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child:  Column (
                          children: [
                            Image(
                                image: AssetImage('assets/man.png'),
                              height: 100,
                              width: 100,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                                'male',
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isMale ? Colors.blue : Colors. grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage('assets/woman.png'),
                              height: 100,
                              width: 100,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'female',
                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isMale ? Colors.grey: Colors.pinkAccent,
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[500],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Height',style:
                    TextStyle(fontWeight: FontWeight.w900,fontSize: 25),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('${height.round()}',
                          style:
                        TextStyle(fontWeight: FontWeight.w900,fontSize: 50),),
                        SizedBox(
                          width: 5,
                        ),
                        Text('cm',style:
                        TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

                      ],
                    ),
                    Slider(
                        value: height,
                        max: 200,
                        min: 60,
                        onChanged:(value){
                          setState(() {
                            height= value;
                          });
                        } ),
                  ],
                ),
              ),
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[500],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Age',
                          style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold,
                          ),),
                          Text('$age',
                            style: TextStyle(
                              fontSize:50,fontWeight: FontWeight.bold,
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                }
                              ,child: Icon(Icons.minimize),
                                mini: true,
                                heroTag: 'age-',
                                ),
                              SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                heroTag: 'age+',
                                onPressed: (){
                                 setState(() {
                                   age++;
                                 });
                                }
                                ,child: Icon(Icons.add),
                                mini: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[500],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('weight',
                            style: TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold,
                            ),),
                          Text('$weight',
                            style: TextStyle(
                              fontSize:50,fontWeight: FontWeight.bold,
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              }
                                ,child: Icon(Icons.minimize),
                                mini: true,
                                heroTag: 'weight--',
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                onPressed: (){
                               setState(() {
                                 weight++;
                               });
                              }
                                ,child: Icon(Icons.add),
                                mini: true,
                                heroTag: 'weight+',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 20),
            child: Container(
              width: double.infinity,
              color: Colors.blue,
              height: 50,
              child: MaterialButton(
                onPressed: (){
                  double result =weight/  pow(height/100 ,2);
                  print(result.round());
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  BmiResult(
                        age: age,
                        isMale: isMale,
                        result: result.round(),
                      ),
                      )
                  );
                },
              child: Text('calculator',style: TextStyle(color: Colors.white),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
