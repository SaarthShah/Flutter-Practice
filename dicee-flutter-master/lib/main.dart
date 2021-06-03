import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftdice=Random().nextInt(6)+1;
  int rightdice=Random().nextInt(6)+1;

  void randomize(){
    leftdice=Random().nextInt(6)+1;
    rightdice=Random().nextInt(6)+1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children:<Widget> [
          Expanded(
            child: FlatButton(
              onPressed:(){
                setState(() {
                  randomize();
                });
              },
              child: Image.asset('images/dice$leftdice.png'),),
          ),
          Expanded(
            child:FlatButton(child: Image.asset('images/dice$rightdice.png'),
              onPressed: (){
                setState(() {
                  randomize();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
