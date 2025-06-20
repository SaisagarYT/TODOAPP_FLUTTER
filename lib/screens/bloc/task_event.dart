part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

final class TaskInitialEvent extends TaskEvent {}

final class TaskHomepageTaskDisplayEvent extends TaskEvent {}

final class AddDetailsToServerEvent extends TaskEvent {
  final String task;
  final String description;
  final String tab;

  AddDetailsToServerEvent({
    required this.task,
    required this.description,
    required this.tab,
  });
}
