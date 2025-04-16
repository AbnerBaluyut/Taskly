import 'package:bloc/bloc.dart';

part 'projects_details_event.dart';
part 'projects_details_state.dart';

class ProjectDetailsBloc extends Bloc<ProjectsDetailsEvent, ProjectsDetailsState> {

  ProjectDetailsBloc() : super(ProjectDetailsInitial());
}