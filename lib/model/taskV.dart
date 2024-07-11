class TaskV{
  final String  name;
  bool isDone;
  TaskV({required this.name,this.isDone=false});

  void isDoneChange(){
    isDone=!isDone;
  }
}