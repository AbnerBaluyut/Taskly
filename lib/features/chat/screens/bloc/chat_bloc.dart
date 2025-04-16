import 'package:bloc/bloc.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {

  ChatBloc() : super(ChatInitial());
}