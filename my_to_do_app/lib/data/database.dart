import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

//referance my box
  final _mybox = Hive.box('mybox');

//if is it the first time
  void createInitialData() {
    toDoList = [
      ["Make tutorial", false],
      ["Do exercise", false],
    ];
  }

  //load data from database
  void loadData() {
    toDoList = _mybox.get("TODOLİST");
  }

  //update data
  void updateDataBase() {
    _mybox.put("TODOLİST", toDoList);
  }
}
