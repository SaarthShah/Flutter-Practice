import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('I am poor')),
            backgroundColor: Colors.blueGrey,
          ),
          backgroundColor: Colors.black38,
          body: Center(
            child: Image(
              image: AssetImage('images/unnamed.png'),
            ),
          ),
        )
    )
    );

}

