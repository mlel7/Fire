import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile(
      {super.key,
      required this.taskCompleted,
      required this.taskName,
      required this.onChange,
      required this.deleteTask,
      required this.primaryColor,
      required this.seconderyColor});
  bool taskCompleted = false;
  String taskName = '';
  Color primaryColor;
  Color seconderyColor;
  Function(bool?)? onChange;
  Function(BuildContext)? deleteTask;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: <SlidableAction>[
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              autoClose: true,
              borderRadius: BorderRadius.circular(13),
            ),
          ],
        ),
        child: CheckboxListTile(
          value: taskCompleted,
          onChanged: onChange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          tileColor: primaryColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
          activeColor: seconderyColor,
          checkColor: primaryColor,
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          side: BorderSide(color: seconderyColor, width: 2),
          dense: true,
          title: SelectableText(taskName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: taskCompleted ? TextDecoration.lineThrough:TextDecoration.none,
                  decorationThickness: 3,
                  decorationColor: primaryColor)),
        ),
      ),
    );
  }
}
