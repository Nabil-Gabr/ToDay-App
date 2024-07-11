
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:today/widgets/list_tile.dart';
import 'package:provider/provider.dart';
import 'package:today/model/task_data.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ListView_W extends StatefulWidget {

  @override
  State<ListView_W> createState() => _ListView_WState();
}

class _ListView_WState extends State<ListView_W> {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder:(context, value, child) {
      return ListView.builder(
    itemCount: value.tasks.length,
    itemBuilder: (context, index) {
      return ListTile_W(
        taskTitle:value.tasks[index].name, 
        isChecked:value.tasks[index].isDone ,
        checkboxChange: (newValue) {
          value.updateTask(value.tasks[index]);
         
        }, 
        
        listTileDelete: () {
          AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.warning,
          title: 'warning!',
          desc:   'ara sure of the deleting process',
          btnCancelColor: Colors.green,
          btnOkColor: Colors.red,
          btnCancelText: "Cancel",
          btnOkText: "Delete",
          btnCancelOnPress:(){} ,
          btnOkOnPress: () {
            value.deleteTask(value.tasks[index]);
          },
          ).show();
          
        },);
      
    
        },);
      
    },);
  }
}

