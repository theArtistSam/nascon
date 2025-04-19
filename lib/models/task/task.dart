import 'package:nascon_prep/models/job/job.dart';

class Task extends Job {
  @override
  final String id;
  final String projectId;
  final String name;
  final List<String> members;
  final DateTime startDate;
  final DateTime endDate;
  final int label;
  final String description;

  Task({
    required this.id,
    required this.name,
    required this.projectId,
    required this.members,
    required this.startDate,
    required this.endDate,
    this.label = 0,
    required this.description,
  }) : super(id: id, members: members, name: name);

  Task copyWith({
    String? id,
    String? name,
    String? projectId,
    List<String>? members,
    DateTime? startDate,
    DateTime? endDate,
    int? label,
    String? description,
  }) {
    return Task(
      id: id ?? this.id,
      name: name ?? this.name,
      projectId: projectId ?? this.projectId,
      members: members ?? this.members,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      label: label ?? this.label,
      description: description ?? this.description,
    );
  }
}
