part of '../bloc.dart';

@immutable
class ProjectState extends Equatable {
  final String? message;

  const ProjectState({this.message});

  @override
  List<Object?> get props => [message];
}

@immutable
class ProjectStateDefault extends ProjectState {
  const ProjectStateDefault();
}

@immutable
class ProjectStateLoading extends ProjectState {
  const ProjectStateLoading();
}

@immutable
class ProjectStateSuccess extends ProjectState {
  const ProjectStateSuccess();

  @override
  List<Object?> get props => [];
}

@immutable
class ProjectStateFailure extends ProjectState {
  const ProjectStateFailure({required String message})
    : super(message: message);
}
