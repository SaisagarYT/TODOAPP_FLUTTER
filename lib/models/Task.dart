import 'package:flutter/foundation.dart';

class Task {
  final String id;
  final String task;
  final DateTime date;
  final String description;
  final String tab;

  Task({
    required this.id,
    required this.date,
    required this.description,
    required this.task,
    required this.tab,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['_id'],
      task: json['task'],
      date: DateTime.parse(json['date']).toLocal(),
      description: json['description'],
      tab: json['tab'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'task': task, 'description': description, 'tab': tab};
  }
}
