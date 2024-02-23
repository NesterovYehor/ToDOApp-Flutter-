import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/diolog_box.dart';
import 'package:to_do_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    if (_box.get("TODOLIST") == null){
      db.createInitialData();
    }
    else{
      db.load();
    }
    super.initState();
  }

  final _box = Hive.box("tasks");
  ToDoDataBase db = ToDoDataBase();

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      _controller.clear();
    });
    db.updateData();
  }
  
  void save(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void addNewTask(){
    showDialog(
      context: context, 
      builder: (context) {
        return DiologBox(
          controller: _controller, 
          onSave: save, 
          onCancel: () => Navigator.of(context).pop(),
          );
    },
    ); 
    db.updateData();
  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('T O D O'),
        elevation: 0,
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        backgroundColor: Colors.yellow,
        child: Icon(Icons.add),
        ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompletade: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
            );
        }
      ),
    );
  }
}