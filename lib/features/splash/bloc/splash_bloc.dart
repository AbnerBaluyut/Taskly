import 'package:bloc/bloc.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  
  SplashBloc() : super(SplashInitialState()) {
    on<SplashEvent>(_init);
  }

  void _init(SplashEvent event, Emitter<SplashState> emit) async {

    emit(SplashLoadingState());
    await Future.delayed(3.seconds());
    emit(SplashLoadedState());
  }
}