import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/todomodel.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todomodel> _todos = [];
  List<Todomodel> _todochuathanhcong = [];
  List<Todomodel> _todothanhcong = [];
  List<Todomodel> get todoss => _todos.toList();
  List<Todomodel> get todochuathanhcong =>
      _todos.where((todo) => todo.isSelected == false).toList();
  List<Todomodel> get todoThanhCong =>
      _todothanhcong = _todos.where((todo) => todo.isSelected == true).toList();

  void addTodoItem(String text) {
    _todos.add(Todomodel(text, false));
    notifyListeners();
  }
}
