import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBloc extends Cubit<bool> {

  BottomNavBloc() : super(true);

  void setIsHideBottomNav(bool value) {
    emit(value);
  }
}