import 'package:flutter/material.dart';
import 'package:flutter_app1/models/todo_model.dart';
import 'package:flutter_app1/services/todo_services.dart';
import 'package:flutter_app1/views/todo/todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /*List<TodoModel> todo = [];
  bool isLoading = true;

  gettodo() async {
    todo = await Todoservice().getTodoData();
    isLoading = false;
    setState(() {});
  }*/

  /*@override
  void initState() {
    super.initState();
    gettodo();
  }*/

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocConsumer<TodoCubit, TodoState>(builder: (context, state) {
        if (state is TodoLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TodoSuccess) {
          return ListView.builder(
              itemCount: context.watch<TodoCubit>().todo.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(
                      context.watch<TodoCubit>().todo[index].id.toString() ??
                          "--"),
                  title: Text(
                    context.watch<TodoCubit>().todo[index].title ?? "--",
                    style: TextStyle(color: Color(0xff117ad2)),
                  ),
                  subtitle: Text(context
                          .watch<TodoCubit>()
                          .todo[index]
                          .completed
                          .toString() ??
                      "--"),
                  trailing: Icon(Icons.ads_click),
                );
              });
        } else {
          return Center(
            child: Text("Error in this screen"),
          );
        }
      }, listener: (context, state) {
        if (state is TodoError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Hello we have error"),
          ));
        }
      }),
    );

    /* isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: todo.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(todo[index].id.toString() ?? "--"),
                title: Text(
                  todo[index].title ?? "--",
                  style: TextStyle(color: Color(0xff117ad2)),
                ),
                subtitle: Text(todo[index].completed.toString() ?? "--"),
                trailing: Icon(Icons.ads_click),
              );
            }
          );*/
  }
}
