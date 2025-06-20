part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

final class TaskInitialEvent extends TaskEvent {}

final class TaskHomepageTaskDisplayEvent extends TaskEvent {}