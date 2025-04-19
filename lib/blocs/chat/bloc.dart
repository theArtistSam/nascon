import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'event.dart';
part 'state.dart';
part 'states/_test.dart';
part 'data_provider.dart'; // Added reference to data_provider.dart

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatProvider _provider = ChatProvider();

  ChatBloc() : super(const ChatInitial()) {
    on<ChatEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
