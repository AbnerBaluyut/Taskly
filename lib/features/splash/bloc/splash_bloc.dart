import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskly/core/extensions/int_ext.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  
  SplashBloc() : 
    super(SplashInitialState()) {
      on<LoadSplashEvent>(_init);
    }

  void _init(LoadSplashEvent event, Emitter<SplashState> emit) async {

    emit(SplashLoadingState());
    await Future.delayed(3.seconds());
    emit(SplashLoadedState());
  }
}