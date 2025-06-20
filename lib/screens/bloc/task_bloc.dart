import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

List<String> tasks = [];

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<OnSavingTaskEvent>((event, emit) {
      tasks.add(event.task);
    });

    on<TaskHomepageTaskDisplayEvent>((event, emit) {
      emit(HomepageInitialDisplayState(tasks: tasks));
    });
  }
}
