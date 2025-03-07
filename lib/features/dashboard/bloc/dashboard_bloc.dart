import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';

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