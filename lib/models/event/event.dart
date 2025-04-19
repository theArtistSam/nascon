import 'package:nascon_prep/models/job/job.dart';

class Event extends Job {
  final DateTime startDate;
  final DateTime endDate;

  const Event({
    required super.id,
    required super.name,
    required super.members,
    required this.startDate,
    required this.endDate,
  });

  @override
  Event copyWith({
    String? id,
    String? name,
    List<String>? members,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return Event(
      id: id ?? this.id,
      name: name ?? this.name,
      members: members ?? this.members,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] as String,
      name: json['name'] as String,
      members: List<String>.from(json['members'] as List),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'members': members,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }
}
