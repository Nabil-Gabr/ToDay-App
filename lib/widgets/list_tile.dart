import 'package:flutter/material.dart';

class ListTile_W extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final void Function(bool?) checkboxChange; 
  final void Function() listTileDelete; 

  const ListTile_W({required this.taskTitle, required this.isChecked, required this.checkboxChange, required this.listTileDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,
      decoration: isChecked?TextDecoration.lineThrough:null)),
     

      trailing: Checkbox(
      activeColor: Colors.teal[400],
      value: isChecked, 
      onChanged: checkboxChange,
      ),

      onLongPress: listTileDelete,
    );
  }
}

