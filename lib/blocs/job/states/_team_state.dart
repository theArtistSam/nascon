part of '../bloc.dart';

@immutable
class TeamState extends Equatable {
  final String? message;

  const TeamState({this.message});

  @override
  List<Object?> get props => [message];
}

@immutable
class TeamStateDefault extends TeamState {
  const TeamStateDefault();
}

@immutable
class TeamStateLoading extends TeamState {
  const TeamStateLoading();
}

@immutable
class TeamStateSuccess extends TeamState {
  const TeamStateSuccess();

  @override
  List<Object?> get props => [];
}

@immutable
class TeamStateFailure extends TeamState {
  const TeamStateFailure({required String message}) : super(message: message);
}
