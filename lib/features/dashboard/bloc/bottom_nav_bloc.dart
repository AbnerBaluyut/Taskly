import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBloc extends Cubit<bool> {

  BottomNavBloc() : super(true);

  void setIsVisibleBottomNav(bool value) {
    emit(value);
  }
}