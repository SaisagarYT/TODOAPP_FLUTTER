import 'package:flutter/foundation.dart';

class Task {
  final String id;
  final String task;
  final DateTime date;
  final String description;

  Task({required this.id, required this.date, required this.description, required this.task});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id:json['_id'],
      task: json['task'],
      date: DateTime.parse(json['date']),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id':id,'task': task, 'date': date, 'description': description};
  }
}
