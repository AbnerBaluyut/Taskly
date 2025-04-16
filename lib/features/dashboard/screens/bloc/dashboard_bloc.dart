
import 'package:bloc/bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {

  DashboardBloc() : super(InitialSideMenuState()) {
    on<OpenSideMenuEvent>(_onOpenSideMenuEvent);
    on<CloseSideMenuEvent>(_onCloseSideMenuEvent);
  }

  void _onOpenSideMenuEvent(OpenSideMenuEvent event, Emitter<DashboardState> emit) {
    emit(SideMenuState(isOpenSideMenu: true));
  }

  void _onCloseSideMenuEvent(CloseSideMenuEvent event, Emitter<DashboardState> emit) {
    emit(SideMenuState(isOpenSideMenu: false));
  }
}