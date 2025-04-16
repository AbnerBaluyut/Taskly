part of 'dashboard_bloc.dart';

sealed class DashboardState {}

class InitialSideMenuState extends DashboardState {}

class SideMenuState extends DashboardState {

  final bool isOpenSideMenu;
  SideMenuState({this.isOpenSideMenu = false});
}