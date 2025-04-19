import 'package:nascon_prep/models/job/job.dart';

class Team extends Job {
  final bool isPrivate;
  final String img;

  const Team({
    required super.id,
    required super.members,
    required super.name,
    this.isPrivate = true,
    required this.img,
  });

  @override
  Team copyWith({
    String? id,
    List<String>? members,
    String? name,
    bool? isPrivate,
    String? img,
  }) {
    return Team(
      id: id ?? this.id,
      img: img ?? this.img,
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
      img: json['img'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'members': members,
      'name': name,
      'isPrivate': isPrivate,
      'img': img,
    };
  }
}
