part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class OnSavingTaskInDataBaseState extends TaskInitial {
  
}

final class HomepageInitialDisplayState extends TaskInitial{
  final List<String> tasks;
  HomepageInitialDisplayState({required this.tasks});
}
