part of '../bloc.dart';

@immutable
class EventState extends Equatable {
  final String? message;

  const EventState({this.message});

  @override
  List<Object?> get props => [message];
}

@immutable
class EventStateDefault extends EventState {
  const EventStateDefault();
}

@immutable
class EventStateLoading extends EventState {
  const EventStateLoading();
}

@immutable
class EventStateSuccess extends EventState {
  const EventStateSuccess();

  @override
  List<Object?> get props => [];
}

@immutable
class EventStateFailure extends EventState {
  const EventStateFailure({required String message}) : super(message: message);
}
