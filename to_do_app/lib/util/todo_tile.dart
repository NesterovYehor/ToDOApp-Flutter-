// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile({super.key, required this.taskName, required this.taskCompletade, required this.onChanged, required this.deleteFunction});

  final String taskName;
  final bool taskCompletade;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),
            )
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompletade, 
                onChanged: onChanged,
                activeColor: Colors.black,
                ),
              Text(
                taskName,
                style: TextStyle(decoration: taskCompletade ? TextDecoration.lineThrough : TextDecoration.none),
                ),
            ],
          ),
        ),
      ),
    );
  }
}