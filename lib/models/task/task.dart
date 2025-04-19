import 'package:nascon_prep/models/job/job.dart';

class Task extends Job {
  final String projectId;
  final DateTime startDate;
  final DateTime endDate;
  final int label;
  final String description;

  Task({
    required super.id,
    required super.name,
    required this.projectId,
    required super.members,
    required this.startDate,
    required this.endDate,
    this.label = 0,
    required this.description,
  });

  @override
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

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      name: json['name'] as String,
      projectId: json['projectId'] as String,
      members: List<String>.from(json['members'] as List),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      label: json['label'] as int? ?? 0,
      description: json['description'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'projectId': projectId,
      'members': members,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'label': label,
      'description': description,
    };
  }
}
