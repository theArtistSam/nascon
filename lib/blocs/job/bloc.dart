import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nascon_prep/models/chat/chat.dart';
import 'package:nascon_prep/models/project/project.dart';
import 'package:nascon_prep/models/task/task.dart';
import 'package:nascon_prep/models/team/team.dart';
import 'package:nascon_prep/models/event/event.dart';

part 'event.dart';
part 'state.dart';
part 'states/_task_state.dart';
part 'states/_event_state.dart';
part 'states/_team_state.dart';
part 'states/_project_state.dart';
part 'data_provider.dart'; // Added reference to data_provider.dart

class JobBloc extends Bloc<JobEvent, JobState> {
  final JobProvider _provider = JobProvider();
  final String userId = '2uo79zX41UF9wM3KN9FK';

  JobBloc() : super(const JobInitial()) {
    on<CreateTask>(_createTask);
    on<CreateEvent>(_createEvent);
    on<CreateProject>(_createProject);
    on<CreateTeam>(_createTeam);

    // Fetch Events
    on<FetchEvents>(_fetchEvents);
    on<FetchTasks>(_fetchTasks);
    on<FetchProjects>(_fetchProjects);
    on<FetchTeams>(_fetchTeams);
  }

  FutureOr<void> _createTask(CreateTask event, Emitter<JobState> emit) async {
    emit(state.copyWith(task: const TaskStateLoading()));

    try {
      final docRef =
          FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('tasks')
              .doc(); // generate doc ref with ID

      final task = Task(
        id: docRef.id,
        name: event.name,
        projectId: event.projectId,
        members: event.members,
        startDate: event.startDate,
        endDate: event.endDate,
        description: event.description,
      );

      await _provider.createTask(task: task, userId: userId);

      emit(state.copyWith(task: const TaskStateSuccess()));
    } catch (e) {
      emit(state.copyWith(task: TaskStateFailure(message: e.toString())));
    }
  }

  FutureOr<void> _createEvent(CreateEvent event, Emitter<JobState> emit) async {
    emit(state.copyWith(event: const EventStateLoading()));

    try {
      final docRef =
          FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('events')
              .doc(); // generate doc ref with ID

      final eventData = Event(
        id: docRef.id,
        name: event.name,
        startDate: event.startDate,
        endDate: event.endDate,
        members: event.members,
      );

      await _provider.createEvent(event: eventData, userId: userId);

      emit(state.copyWith(event: const EventStateSuccess()));
    } catch (e) {
      emit(state.copyWith(event: EventStateFailure(message: e.toString())));
    }
  }

  FutureOr<void> _createProject(
    CreateProject event,
    Emitter<JobState> emit,
  ) async {
    emit(state.copyWith(project: const ProjectStateLoading()));

    try {
      final docRef =
          FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('projects')
              .doc(); // generate doc ref with ID

      final project = Project(
        id: docRef.id,
        name: event.name,
        description: event.description,
        startDate: event.startDate,
        endDate: event.endDate,
        members: event.members,
      );

      await _provider.createProject(project: project, userId: userId);

      emit(state.copyWith(project: const ProjectStateSuccess()));
    } catch (e) {
      emit(state.copyWith(project: ProjectStateFailure(message: e.toString())));
    }
  }

  FutureOr<void> _createTeam(CreateTeam event, Emitter<JobState> emit) async {
    emit(state.copyWith(team: const TeamStateLoading()));

    try {
      final docRef =
          FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('teams')
              .doc(); // generate doc ref with ID

      final team = Team(
        id: docRef.id,
        name: event.name,
        isPrivate: false,
        img: '',
        members: event.members,
      );

      await _provider.createTeam(team: team, userId: userId);

      emit(state.copyWith(team: const TeamStateSuccess()));
    } catch (e) {
      emit(state.copyWith(team: TeamStateFailure(message: e.toString())));
    }
  }

  //  Fetch Method
  FutureOr<void> _fetchEvents(FetchEvents event, Emitter<JobState> emit) {}

  FutureOr<void> _fetchProjects(
    FetchProjects event,
    Emitter<JobState> emit,
  ) async {
    // Emit loading state
    emit(state.copyWith(project: ProjectStateLoading()));

    try {
      // Use the userId from the event, not an undefined variable
      final projects = await _provider.fetchProjects(userId: userId);

      // Emit the success state with updated projects
      emit(state.copyWith(projects: projects, project: ProjectStateSuccess()));
    } catch (e) {
      // Emit failure state with error message
      emit(
        state.copyWith(
          project: ProjectStateFailure(message: 'Failed to fetch projects: $e'),
        ),
      );
    }
  }

  FutureOr<void> _fetchTeams(FetchTeams event, Emitter<JobState> emit) {}

  FutureOr<void> _fetchTasks(FetchTasks event, Emitter<JobState> emit) {}
}
