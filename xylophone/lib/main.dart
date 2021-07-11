import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(Container());
}

   class XylophonePlayer extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return MaterialApp(
         home:Scaffold(
           body: SafeArea(
             child: Center(child: FlatButton(child: Text('Click Me'),
               onPressed: (){},),),
           ),
         ),
       );
     }
   }
