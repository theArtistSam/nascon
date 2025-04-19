part of '../bloc.dart';

@immutable
class ChatTestState extends Equatable {
  static bool match(ChatState a, ChatState b) => a.test != b.test;

  final String? message;

  const ChatTestState({this.message});

  @override
  List<Object?> get props => [message];
}

@immutable
class ChatTestDefault extends ChatTestState {
  const ChatTestDefault();
}

@immutable
class ChatTestLoading extends ChatTestState {
  const ChatTestLoading();
}

@immutable
class ChatTestSuccess extends ChatTestState {
  const ChatTestSuccess();
}

@immutable
class ChatTestFailure extends ChatTestState {
  const ChatTestFailure({required String message}) : super(message: message);
}
