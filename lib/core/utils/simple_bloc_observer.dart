
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///
/// A custom BlocObserver to monitor and log Bloc events, errors, and transitions.
///
class SimpleBlocObserver extends BlocObserver {
  static const String reset = '\x1B[0m';
  static const String blue = '\x1B[34m';
  static const String red = '\x1B[31m';
  static const String bold = '\x1B[1m';

  /// Called whenever an event is added to any Bloc.
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    if (kDebugMode) {
      log(
        '$blue\n'
        '--------------------------------\n'
        'Bloc  : ${bloc.runtimeType}     \n'
        'Event : ${event.toString()}     \n'
        '--------------------------------$reset\n',
      );
    }
  }

  /// Called whenever an error occurs in any Bloc.
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    if (kDebugMode) {
      log(
        '$red$bold\n'
        '════════════════════════════════════════\n'
        '               BLOC ERROR               \n'
        '════════════════════════════════════════\n'
        'Bloc   : ${bloc.runtimeType}          \n\n'
        'Error  : $error                         \n'
        'StackTrace:\n$stackTrace                \n'
        '════════════════════════════════════════$reset\n',
      );
    }

    /// Called whenever a state transition occurs in any Bloc.
    // @override
    // void onTransition(Bloc bloc, Transition transition) {
    //   super.onTransition(bloc, transition);

    //   LogHelper.info(
    //     tag: "onTransition",
    //     message:
    //         '\n'
    //         '════════════════════════════════════════\n'
    //         '         BLOC STATE TRANSITION          \n'
    //         '════════════════════════════════════════\n'
    //         'Bloc: ${bloc.runtimeType}               \n'
    //         '----------------------------------------\n'
    //         '▶ FROM: ${transition.currentState}      \n'
    //         '▶ TO:   ${transition.nextState}         \n'
    //         '════════════════════════════════════════\n'
    //         '\n',
    //   );
    // }
  }
}