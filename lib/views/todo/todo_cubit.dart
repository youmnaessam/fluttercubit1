import 'package:bloc/bloc.dart';
import 'package:flutter_app1/models/todo_model.dart';
import 'package:flutter_app1/services/todo_services.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial()) {
    getTodo();
  }

  List<TodoModel> todo = [];
  bool isLoading = true;

  getTodo() async {
    emit(TodoLoading());
    try {
      todo = await Todoservice().getTodoData();
      isLoading = false;
      //throw Exception();
      emit(TodoSuccess());
    } catch (e) {
      print(e.toString());
      emit(TodoError());
    }
  }
}
