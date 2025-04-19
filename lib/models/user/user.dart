class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String img;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.img,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? img,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      img: img ?? this.img,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      img: json['img'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'phone': phone, 'img': img};
  }
}
