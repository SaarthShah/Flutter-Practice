import 'package:flutter/material.dart';
import 'package:todoey/Widgets/task_tile.dart';
import 'package:todoey/Models/tasks.dart';
import 'package:todoey/screens/taskscreen.dart';
import 'package:todoey/Models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context , index ){
      return TaskTile(isChecked: Provider.of<TaskData>(context).tasks[index].isDone, taskTitle: Provider.of<TaskData>(context).tasks[index].name, checkboxCallback: (checkboxstate){
         Provider.of<TaskData>(context, listen: false).toggle(index);
      }, longpressCallback: (){
        Provider.of<TaskData>(context, listen: false).remove(index);
      },);
    },
      itemCount: Provider.of<TaskData>(context).tasks.length,
    );
  }
}
