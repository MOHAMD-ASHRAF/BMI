import 'package:flutter/material.dart';
class BmiResult extends StatelessWidget {

  final int age;
  final int result;
  final bool isMale;

  BmiResult({
    required this.age,
    required this.result,
    required this.isMale,
});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
            icon: Icon(Icons.arrow_back_ios)),
        title: Center(
            child: Text('BMI Result')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender : ${isMale ? 'Male' : 'female'}',style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            Text('Result : $result',style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            Text('Age : $age',style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)
          ],
        ),
      ),
    );
  }
}
