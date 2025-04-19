part of 'bloc.dart';

sealed class JobEvent extends Equatable {
  const JobEvent();

  @override
  List<Object> get props => [];
}

class CreateTask extends JobEvent {
  final String name;
  final List<String> members;
  final String projectId;
  final DateTime startDate;
  final DateTime endDate;
  final int label;
  final String description;

  const CreateTask({
    required this.name,
    required this.projectId,
    required this.members,
    required this.startDate,
    required this.endDate,
    required this.label,
    required this.description,
  });
}

class FetchTasks extends JobEvent {}

class FetchEvents extends JobEvent {}

class FetchProjects extends JobEvent {}

class FetchTeams extends JobEvent {}

class CreateProject extends JobEvent {
  final String name;
  final List<String> members;
  final DateTime startDate;
  final DateTime endDate;
  final int label;
  final String description;

  const CreateProject({
    required this.members,
    required this.name,
    required this.startDate,
    required this.endDate,
    this.label = 0,
    required this.description,
  });
}

class CreateEvent extends JobEvent {
  final String name;
  final List<String> members;
  final DateTime startDate;
  final DateTime endDate;

  const CreateEvent({
    required this.name,
    required this.members,
    required this.startDate,
    required this.endDate,
  });
}

class CreateTeam extends JobEvent {
  final String name;
  final List<String> members;
  final List<String> img;
  final bool isPrivate;

  const CreateTeam({
    required this.members,
    required this.name,
    required this.img,
    this.isPrivate = true,
  });
}
