import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/todomodel.dart';
import 'package:flutter_application_1/provider/todo_provider.dart';
import 'package:flutter_application_1/widget/taskall.dart';
import 'package:provider/provider.dart';

class TaskSucess extends StatefulWidget {
  //TaskSucess();

  @override
  _TaskSucessState createState() => _TaskSucessState();
}

class _TaskSucessState extends State<TaskSucess> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    final todos = provider.todoThanhCong;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Complete'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return CheckboxListTile(
                value: todos[index].isSelected,
                onChanged: (value) {},
                title: Text(todos[index].text),
              );
            }),
      ),
    );
  }
}
