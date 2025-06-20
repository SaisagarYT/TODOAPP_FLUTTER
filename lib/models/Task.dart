import 'package:flutter/foundation.dart';

class Task {
  final String task;
  final DateTime date;
  final String description;

  Task({required this.date, required this.description, required this.task});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      task: json['task'],
      date: json['date'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'task': task, 'date': date, 'description': description};
  }
}
