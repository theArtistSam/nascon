part of '../bloc.dart';

@immutable
class TaskState extends Equatable {
  static bool match(JobState a, JobState b) => a.task != b.task;

  final String? message;

  const TaskState({this.message});

  @override
  List<Object?> get props => [message];
}

@immutable
class JobTestDefault extends TaskState {
  const JobTestDefault();
}

@immutable
class TaskStateLoading extends TaskState {
  const TaskStateLoading();
}

@immutable
class TaskStateSuccess extends TaskState {
  const TaskStateSuccess();
}

@immutable
class TaskStateFailure extends TaskState {
  const TaskStateFailure({required String message}) : super(message: message);
}
