import 'package:hive/hive.dart';

class ToDoDataBase{
  final _box = Hive.box("tasks");

  List toDoList = [];

  void createInitialData(){
    toDoList = [
      ["Do something", false]
    ];
  }
  void load(){
    toDoList = _box.get("TODOLIST");
  }
  void updateData(){
    _box.put("TODOLIST", toDoList);
  }
}