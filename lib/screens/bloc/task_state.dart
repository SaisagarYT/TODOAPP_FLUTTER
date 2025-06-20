part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class HomepageInitialDisplayState extends TaskInitial {
  List<Task> tasks;
  HomepageInitialDisplayState({required this.tasks});
}
