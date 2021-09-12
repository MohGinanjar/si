import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si/models/todo.dart';

class TodoController extends GetxController {
  List<Todo>? _todos;
  List<Todo>? get todos => _todos;

  TodoController() {
    _todos = [];
  }

  var todosvalue = TextEditingController();

  addTodo(Todo todo) {
    _todos!.add(todo);
    update();
  }

  deleteTodo(String id) {
    _todos!.removeWhere((element) => element.id == id);
    update();
  }

  changeStatus(Todo todo) {
    int index = _todos!.indexOf(todo);
    _todos![index].isCompleted = _todos![index].isCompleted;
    print(_todos![index].isCompleted);
    update();
  }

  updatedTodo(Todo oldtodo, String newtodo) {
    int index = _todos!.indexOf(oldtodo);
    _todos![index].description = newtodo;

    update();
  }
}
