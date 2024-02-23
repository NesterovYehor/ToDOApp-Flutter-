// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_button.dart';

class DiologBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DiologBox({
    super.key, 
    required this.controller, 
    required this.onSave, 
    required this.onCancel
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Add a new Task"
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyBotton(text: "Save", onPressed: onSave,),
                  const SizedBox(width: 8,),
                  MyBotton(text: "Cancel", onPressed: onCancel,)
                ],
              ),
          ]),
      ),
    );
  }
}