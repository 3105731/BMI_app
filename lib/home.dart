
import 'dart:math';

import 'result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isMale = true;
  double heightVal = 170 ;
  int weight = 55 ;
  int age = 18 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [ Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  B1Expanded(context, 'Male'),
                  const SizedBox(width: 15,),
                  B1Expanded(context, 'Female'),
                ],
              ),
            ),
          ), Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Height', style: Theme.of(context).textTheme.headlineLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                      Text('${heightVal.toStringAsFixed(1)} ', style: Theme.of(context).textTheme.headlineLarge),
                      Text('cm', style: Theme.of(context).textTheme.headlineMedium),
                    ],),
                    Slider(
                      max: 220,
                        min: 90,
                        value: heightVal,
                        onChanged: (newValue){
                        setState(() => heightVal = newValue);
                        }),
                  ],
                ),
              ),
            ),
          ),Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  B2Expanded(context, 'Weight'),
                  const SizedBox(width: 15,),
                  B2Expanded(context, 'Age'),
                ],
              ),
            ),
          ),
            Container(
              height: MediaQuery.of(context).size.height/12,
              width: double.infinity,
              color: Colors.teal,
              child: TextButton(
                  onPressed: (){
                  var  result = weight /pow(heightVal /100, 2)  ;
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                     return Result(result: result, age: age, isMale: isMale);
                    }));
                  },
                  child:  Text("Calculate",
                      style: Theme.of(context).textTheme.headlineLarge
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded B1Expanded(BuildContext context, String type) {
    return Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() => isMale =  type == 'Male'? true : false);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: (isMale && type == 'Male')|| (!isMale && type == 'Female') ? Colors.teal :  Colors.blueGrey
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        type == 'Male'? Icons.male :
                        Icons.female,
                        color: Colors.white,),
                      const SizedBox(height: 15,),
                      Text( type == 'Male'? 'Male' : 'Female', style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium),
                    ],
                  ),
                ),
              ),
            );
  }
  Expanded B2Expanded(BuildContext context, String type) {
    return Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15,),
                    Text( type == 'Age'? 'Age' : 'Weight', style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium),
                    const SizedBox(height: 15,),
                    Text( type == 'Age'? '$age' : '$weight',
                      style: Theme
                        .of(context)
                        .textTheme
                        .headlineLarge,
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          heroTag: type == 'Age' ? 'Age--' : 'Weight--',
                          onPressed: ()=> setState(() {
                            type == 'Age' ? age-- : weight--;
                          }),
                          child: Icon(Icons.remove),
                        ),
                        SizedBox(width: 20,),
                        FloatingActionButton(
                          heroTag:  type == 'Age' ? 'Age++' : 'Weight++',
                          onPressed: ()=> setState(() {
                              type == 'Age' ? age++ : weight++;
                            }),
                          child: Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
  }
}