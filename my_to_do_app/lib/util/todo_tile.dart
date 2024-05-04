import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              onPressed: deleteFunction,
              backgroundColor: Colors.black,
              icon: Icons.delete,
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(30),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).primaryColor,
          ),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              //task name
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
