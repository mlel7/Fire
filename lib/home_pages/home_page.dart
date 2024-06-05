import 'package:flutter/material.dart';
import 'package:flutter_projects/data/database.dart';
import 'package:flutter_projects/widgets/DialogBox.dart';
import 'package:flutter_projects/widgets/todo_tile.dart';
import 'package:hive/hive.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  ToDoDatabase db = ToDoDatabase();
  final _mybox = Hive.box("mybox");
  @override
  void initState() {
    if(_mybox.get("todolist") == null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }
  void checkBoxChanged(value, index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }
  void saveNewTask(String taskName){
    setState(() {
      db.toDoList.add([taskName, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }
  void addTask() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        controller: _controller,
        onSave: ()=> saveNewTask(_controller.text),
        onCancel:() => Navigator.of(context).pop(),
      )
    );
    db.updateDataBase();
  }
  void deleteTask(int item){
    setState(() {
      db.toDoList.removeAt(item);
    });
    db.updateDataBase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (BuildContext context, int index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChange: (val) => checkBoxChanged(val, index),
              deleteTask:(context)=>deleteTask(index),
              primaryColor: Theme.of(context).primaryColor,
              seconderyColor: Theme.of(context).scaffoldBackgroundColor,
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        hoverColor: Theme.of(context).hoverColor,
        child: const Icon(Icons.add),
        onPressed: () {
          addTask();
        },
      ),
    );
  }
}
