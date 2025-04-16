import 'package:bloc/bloc.dart';

part 'view_notifications_event.dart';
part 'view_notifications_state.dart';

class ViewNotificationsBloc extends Bloc<ViewNotificationsEvent, ViewNotificationsState> {

  ViewNotificationsBloc() : super(ViewNotificationsInitial());
}