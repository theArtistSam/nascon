part of 'bloc.dart';

@immutable
class ChatState extends Equatable {
  final ChatTestState? test;
  const ChatState({this.test});

  ChatState copyWith({ChatTestState? test}) {
    return ChatState(test: test ?? this.test);
  }

  @override
  List<Object?> get props => [test];
}

final class ChatInitial extends ChatState {
  const ChatInitial() : super(test: const ChatTestState());
}
