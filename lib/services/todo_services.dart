import 'package:dio/dio.dart';
import 'package:flutter_app1/models/todo_model.dart';

class Todoservice {
  String ur1 = "https://jsonplaceholder.typicode.com/todos";

  Future<List<TodoModel>> getTodoData() async {
    List<TodoModel> todoList = [];
    final dio = Dio();
    final response = await dio.get(ur1);
    var data = response.data;
    data.forEach((jsonElment) {
      TodoModel Todo = TodoModel.fromJson(jsonElment);
      todoList.add(Todo);
    });
    return todoList;
  }
}
