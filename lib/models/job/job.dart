class Job {
  final String id;
  final List<String> members;
  final String name;

  const Job({required this.id, required this.members, required this.name});

  Job copyWith({String? id, List<String>? members, String? name}) {
    return Job(
      id: id ?? this.id,
      members: members ?? this.members,
      name: name ?? this.name,
    );
  }

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'] as String,
      members: List<String>.from(json['members'] as List),
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'members': members, 'name': name};
  }
}
