part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

final class TaskInitialEvent extends TaskEvent {}

final class TaskHomepageTaskDisplayEvent extends TaskEvent {}

final class OnSavingTaskEvent extends TaskInitialEvent {
  final String task;
  OnSavingTaskEvent(this.task);
}
