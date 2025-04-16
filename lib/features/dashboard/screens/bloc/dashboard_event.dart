part of 'dashboard_bloc.dart';

sealed class DashboardEvent {}

class OpenSideMenuEvent extends DashboardEvent {}
class CloseSideMenuEvent extends DashboardEvent {}