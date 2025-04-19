import 'package:nascon_prep/models/job/job.dart';

class Team extends Job {
  final String id;
  final List<String> members;
  final String name;
  final String img;
  final bool isPrivate;

  const Team({
    required this.id,
    required this.members,
    required this.name,
    required this.img,
    this.isPrivate = true,
  }) : super(id: id, name: name, members: members);

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
}
