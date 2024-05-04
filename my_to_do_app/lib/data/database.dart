import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

//referance our box
  final _mybox = Hive.box('mybox');

//run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Make tutorial", false],
      ["Do exercise", false],
    ];
  }

  //load the data from database
  void loadData() {
    toDoList = _mybox.get("TODOLİST");
  }

  //update the data
  void updateDataBase() {
    _mybox.put("TODOLİST", toDoList);
  }
}
