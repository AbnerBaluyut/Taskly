import 'package:bloc/bloc.dart';

part 'create_project_event.dart';
part 'create_project_state.dart';

class CreateProjectBloc extends Bloc<CreateProjectEvent, CreateProjectState> {

  CreateProjectBloc() : super(CreateProjectInitial());
}