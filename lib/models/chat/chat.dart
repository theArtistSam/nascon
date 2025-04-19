class Chat {
  final String id;
  final String senderId;
  final DateTime dateTime;
  final String text;

  const Chat({
    required this.id,
    required this.senderId,
    required this.dateTime,
    required this.text,
  });

  Chat copyWith({
    String? id,
    String? senderId,
    DateTime? dateTime,
    String? text,
  }) {
    return Chat(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      dateTime: dateTime ?? this.dateTime,
      text: text ?? this.text,
    );
  }
}
