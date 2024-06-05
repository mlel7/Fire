
import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];
  final _mybox = Hive.box("mybox");
  void createInitialData(){
    toDoList = [
      ["Simple", false],
      ["Simple", false]
    ];
  }
  void loadData(){
    toDoList = _mybox.get('todolist');
  }
  void updateDataBase(){
    _mybox.put("todolist", toDoList);
  }
}