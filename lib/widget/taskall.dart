import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/todomodel.dart';
import 'package:flutter_application_1/provider/todo_provider.dart';
import 'package:flutter_application_1/widget/tasksuccess.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class TaskAlls extends StatefulWidget {
  @override
  _TaskAllsState createState() => _TaskAllsState();
}

class _TaskAllsState extends State<TaskAlls> {
  final TextEditingController _themtask = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final providers = Provider.of<TodosProvider>(context, listen: true);
    final todos = providers.todoss;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Task",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () {
                    _displayDialog();
                  },
                  child: Text(
                    "Create task",
                    style: TextStyle(color: Colors.black, fontSize: 23),
                  )),
              Container(
                  height: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CheckboxListTile(
                          value: todos[index].isSelected,
                          onChanged: (value) {
                            todos[index].isSelected = !todos[index].isSelected;
                            setState(() {
                              todos[index].isSelected = value!;
                              // if (todos[index].isSelected = false) {
                              //   listchuathanhcong
                              //       .add(Todomodel(todos[index].text, true));
                              // }
                            });
                          },
                          title: Text(todos[index].text),
                        );
                        // ListTodo(todos[index].text, todos[index].isSelected,
                        //     index);
                      }))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _displayDialog() async {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    return showDialog<void>(
        context: this.context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add a new to do item'),
            content: Form(
              key: _formKey,
              child: TextFormField(
                controller: _themtask,
                decoration: InputDecoration(hintText: 'Enter task here'),
                validator: (tilte) {
                  if (tilte!.isEmpty) {
                    return 'The title cannot be empty';
                  }
                  return null;
                },
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  final isValid = _formKey.currentState?.validate();
                  if (!isValid!) {
                    return;
                  } else {
                    provider.addTodoItem(_themtask.text);
                  }

                  Navigator.of(context).pop();
                },
                child: Text('Submit'),
              )
            ],
          );
        });
  }
}
