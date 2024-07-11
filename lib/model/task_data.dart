import 'package:flutter/material.dart';
import 'package:today/model/TaskV.dart';


class TaskData extends ChangeNotifier{
  List<TaskV> tasks=[
    TaskV(name: "go to the club"),
    TaskV(name: "solve academic tasks"),
  ];


  void addTask(String newTaskTitle){
    tasks.add(TaskV(name: newTaskTitle));
    notifyListeners();
  }


  void updateTask(TaskV tsk){
    tsk.isDoneChange();
    notifyListeners();
  }

  void deleteTask(TaskV tsk){
    tasks.remove(tsk);
    notifyListeners();
  }
}