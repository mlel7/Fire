import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  DialogBox({super.key,required this.controller,required this.onSave,required this.onCancel});
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: const Text("Create New Task",
          textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextField(
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          controller: controller,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            hoverColor: Theme.of(context).primaryColor,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        TextButton(
          onPressed: onSave,
          style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(Theme.of(context).hoverColor),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 23,vertical: 10))
          ),
          child: const Text("Save", style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: onCancel,
          style: ButtonStyle(

              padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16,vertical: 10)),
              backgroundColor:
              WidgetStatePropertyAll(Theme.of(context).hoverColor),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          ),

          child: const Text("Cancel", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
