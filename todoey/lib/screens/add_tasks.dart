import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/Models/task_data.dart';
import 'package:todoey/Models/tasks.dart';
import 'package:provider/provider.dart';

class AddTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String newTaskTitle="";

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Tasks',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                color: Colors.lightBlueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              decoration: InputDecoration(),
              onChanged: (value) {
                newTaskTitle=value;
              },
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            FlatButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).AddTask(newTaskTitle);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
    );
  }
}
