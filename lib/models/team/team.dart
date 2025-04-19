import 'package:nascon_prep/models/job/job.dart';

class Team extends Job {
  final bool isPrivate;

  const Team({
    required super.id,
    required super.members,
    required super.name,
    this.isPrivate = true,
  });

  @override
  Team copyWith({
    String? id,
    List<String>? members,
    String? name,
    bool? isPrivate,
  }) {
    return Team(
      id: id ?? this.id,
      members: members ?? this.members,
      name: name ?? this.name,
      isPrivate: isPrivate ?? this.isPrivate,
    );
  }

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'] as String,
      members: List<String>.from(json['members'] as List),
      name: json['name'] as String,
      isPrivate: json['isPrivate'] as bool? ?? true,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {'id': id, 'members': members, 'name': name, 'isPrivate': isPrivate};
  }
}
