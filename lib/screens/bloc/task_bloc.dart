import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_application_6/models/Task.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'task_event.dart';
part 'task_state.dart';

List<Task> tasks = [];

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<TaskHomepageTaskDisplayEvent>(_onTaskDisplayEvent);
    on<AddDetailsToServerEvent>(_onTaskAddToServer);
  }

  FutureOr<void> _onTaskDisplayEvent(
    TaskHomepageTaskDisplayEvent event,
    Emitter<TaskState> emit,
  ) async {
    var uri = Uri.parse(
      "https://todo-flutter-backend.onrender.com/api/task/tasks",
    );
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      tasks.clear();
      for (var d in data) {
        tasks.add(Task.fromJson(d));
      }
      emit(HomepageInitialDisplayState(tasks: tasks));
    }
  }

  FutureOr<void> _onTaskAddToServer(
    AddDetailsToServerEvent event,
    Emitter<TaskState> emit,
  ) async {
    final uri = Uri.parse(
      "https://todo-flutter-backend.onrender.com/api/task/send-task",
    );
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'task': event.task,
        'description': event.description,
        'tab': event.tab,
      }),
    );

    var uri2 = Uri.parse(
      "https://todo-flutter-backend.onrender.com/api/task/tasks",
    );
    var response2 = await http.get(uri2);
    if (response2.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response2.body);
      tasks.clear();
      for (var d in data) {
        tasks.add(Task.fromJson(d));
      }
    }
    emit(HomepageInitialDisplayState(tasks: tasks));
  }
}
