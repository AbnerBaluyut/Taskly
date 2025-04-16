
import 'package:bloc/bloc.dart';

part 'task_details_event.dart';
part 'task_details_state.dart';

class TaskDetailsBloc extends Bloc<TaskDetailsEvent, TaskDetailsState> {

  TaskDetailsBloc() : super(TaskDetailsInitial());
}