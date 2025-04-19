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
}
