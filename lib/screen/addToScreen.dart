import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqf_lite/widgets/todo_form.dart';
import 'package:sqflite/sqflite.dart';

class AddToScreen extends StatefulWidget {
  const AddToScreen({super.key, required this.db});
  final Database db;

  @override
  State<AddToScreen> createState() => _AddToScreenState();
}

class _AddToScreenState extends State<AddToScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController taskController = TextEditingController();
  final TextEditingController createdByController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController expireDateController = TextEditingController();
  bool done = false;
  DateTime? pickDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Your Todo"),
      ),
      body: ToDoForm(
        formkey: formkey,
        taskController: taskController,
        createdByController: createdByController,
        remarksController: remarksController,
        expireDateController: expireDateController,
        done: done,
        onTapExpireDate: () async {
          await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  content: SizedBox(
                    height: 250,
                    child: CupertinoDatePicker(
                      onDateTimeChanged: (dateTime) {
                        pickDate = dateTime;
                      },
                      mode: CupertinoDatePickerMode.date,
                    ),
                  ),
                  actions: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK"))
                  ],
                );
              });
          //for android users
          // final dateTime = await showDatePicker(
          //     context: context,
          //     initialDate: DateTime.now(),
          //     firstDate: DateTime(1900),
          //     lastDate: DateTime(2880));
          if (pickDate != null) {
            final dateString = DateFormat.yMd().format(pickDate!);
            expireDateController.text = dateString.toString();
            setState(() {});
          }
        },
        onDone: (val) {
          done = val ?? false;
          setState(() {});
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            formkey.currentState?.save();
            // if(formkey.currentState!.validate()){

            // }
            final task = taskController.text;
            final createdBy = createdByController.text;
            final remarks = remarksController.text;
            final expiryData = expireDateController.text;
            final insertedId = await widget.db.insert('todo', {
              'task': task,
              'done': done ? 1 : 0,
              'created_by': createdBy,
              'remarks': remarks,
              'expire_data': expiryData,
              'created_at': DateTime.now().microsecondsSinceEpoch,
              'updated_at': DateTime.now().microsecondsSinceEpoch,
            });
            print(insertedId);
          },
          label: const Text("Add your todo")),
    );
  }
}
