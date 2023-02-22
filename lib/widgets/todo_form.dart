import 'package:flutter/material.dart';

class ToDoForm extends StatefulWidget {
  ToDoForm(
      {super.key,
      this.formkey,
      this.done = false,
      this.onDone,
      this.onTapExpireDate,
      required this.createdByController,
      required this.expireDateController,
      required this.remarksController,
      required this.taskController});

  final GlobalKey<FormState>? formkey;
  final TextEditingController taskController;
  final TextEditingController createdByController;
  final TextEditingController remarksController;
  final TextEditingController expireDateController;
  final bool done;
  final void Function(bool?)? onDone;
  final void Function()? onTapExpireDate;

  @override
  State<ToDoForm> createState() => _ToDoFormState();
}

class _ToDoFormState extends State<ToDoForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            TextFormField(
              controller: widget.taskController,
              decoration: const InputDecoration(
                  labelText: 'Task', hintText: "Enter your label task"),
            ),
            TextFormField(
              controller: widget.createdByController,
              decoration: const InputDecoration(
                  labelText: 'Created by', hintText: "Enter Created time"),
            ),
            TextFormField(
              controller: widget.remarksController,
              decoration: const InputDecoration(
                  labelText: 'Remarks', hintText: "Enter your remarks"),
            ),
            GestureDetector(
              onTap: widget.onTapExpireDate,
              child: TextFormField(
                enabled: false,
                controller: widget.expireDateController,
                decoration: const InputDecoration(
                    labelText: 'Expire Date', hintText: "Date of expiry"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(value: widget.done, onChanged: widget.onDone),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Done",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
