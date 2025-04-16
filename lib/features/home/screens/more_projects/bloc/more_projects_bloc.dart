import 'package:bloc/bloc.dart';

part 'more_projects_event.dart';
part 'more_projects_state.dart';

class MoreProjectsBloc extends Bloc<MoreProjectsEvent, MoreProjectsState> {

  MoreProjectsBloc() : super(MoreProjectsInitial());
}