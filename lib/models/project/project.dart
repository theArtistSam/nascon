import 'package:nascon_prep/models/job/job.dart';

class Project extends Job {
  final String id;
  final List<String> members;
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final int label;
  final String description;

  const Project({
    required this.id,
    required this.name,
    required this.members,
    required this.startDate,
    required this.endDate,
    this.label = 0,
    required this.description,
  }) : super(id: id, members: members, name: name);

  Project copyWith({
    String? id,
    String? projectId,
    String? name,
    List<String>? members,
    DateTime? startDate,
    DateTime? endDate,
    int? label,
    String? description,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      members: members ?? this.members,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      label: label ?? this.label,
      description: description ?? this.description,
    );
  }
}
