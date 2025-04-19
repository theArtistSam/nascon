part of 'bloc.dart';

@immutable
class JobState extends Equatable {
  final TaskState? task;
  final EventState? event;
  final ProjectState? project;
  final TeamState? team;
  final List<Chat>? chats;
  final List<Event>? events;
  final List<Project>? projects;
  final List<Team>? teams;

  const JobState({
    this.task,
    this.event,
    this.project,
    this.team,
    this.chats,
    this.events,
    this.projects,
    this.teams,
  });

  JobState copyWith({
    TaskState? task,
    EventState? event,
    ProjectState? project,
    TeamState? team,
    List<Chat>? chats,
    List<Event>? events,
    List<Project>? projects,
    List<Team>? teams,
  }) {
    return JobState(
      task: task ?? this.task,
      event: event ?? this.event,
      project: project ?? this.project,
      team: team ?? this.team,
      chats: chats ?? this.chats,
      events: events ?? this.events,
      projects: projects ?? this.projects,
      teams: teams ?? this.teams,
    );
  }

  @override
  List<Object?> get props => [
    task,
    event,
    project,
    team,
    chats,
    events,
    projects,
    teams,
  ];
}

final class JobInitial extends JobState {
  const JobInitial()
    : super(
        task: const TaskState(),
        event: const EventState(),
        project: const ProjectState(),
        team: const TeamState(),
      );
}
