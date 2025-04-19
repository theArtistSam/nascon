import 'package:nascon_prep/models/job/job.dart';

class Project extends Job {
  final DateTime startDate;
  final DateTime endDate;
  final int label;
  final String description;

  const Project({
    required super.id,
    required super.members,
    required super.name,
    required String projectId,
    required this.startDate,
    required this.endDate,
    this.label = 0,
    required this.description,
  });

  @override
  Project copyWith({
    String? id,
    List<String>? members,
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    int? label,
    String? description,
  }) {
    return Project(
      id: id ?? this.id,
      members: members ?? this.members,
      name: name ?? this.name,
      projectId: id ?? this.id,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      label: label ?? this.label,
      description: description ?? this.description,
    );
  }

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String,
      members: List<String>.from(json['members'] as List),
      name: json['name'] as String,
      projectId: json['projectId'] as String,
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
      'members': members,
      'name': name,
      'projectId': id,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'label': label,
      'description': description,
    };
  }
}
