import 'package:nascon_prep/models/job/job.dart';

class Event extends Job {
  final String id;
  final String name;
  final List<String> members;
  final DateTime startDate;
  final DateTime endDate;

  const Event({
    required this.id,
    required this.name,
    required this.members,
    required this.startDate,
    required this.endDate,
  }) : super(id: id, members: members, name: name);

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
}
