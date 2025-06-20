import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_todo_application_6/models/Task.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'task_event.dart';
part 'task_state.dart';

List<Task> tasks = [];

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<TaskHomepageTaskDisplayEvent>(_onTaskDisplayEvent);
  }

  FutureOr<void> _onTaskDisplayEvent(
    TaskHomepageTaskDisplayEvent event,
    Emitter<TaskState> emit,
  ) async {
    var uri = Uri.parse("http://192.168.72.75:4000/api/task/tasks");
    var response = await http.get(uri);
    if (response.statusCode == 200){
      print(response.body);
    }
    final List<dynamic> data = jsonDecode(response.body);
    tasks.clear();
    tasks = data.map((json) => Task.fromJson(json)).toList();
    emit(HomepageInitialDisplayState(tasks: tasks));
  }
}
