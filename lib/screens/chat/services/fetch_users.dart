import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nascon_prep/models/user/user.dart';

class FetchUsers {
  void getAllUsers() {
    final database = FirebaseFirestore.instance;
    database
        .collection('users')
        .get()
        .then((snapshot) {
          for (var doc in snapshot.docs) {
            print(doc.data());
          }
        })
        .catchError((error) {
          print("Error fetching users: $error");
        });
  }

  List<User> list = [
    User(
      id: '1',
      name: 'John Doe',
      email: 'dah',
      phone: '1234567890',
      img: 'nooo',
    ),
    User(
      id: '1',
      name: 'John Doe',
      email: 'dah',
      phone: '1234567890',
      img: 'nooo',
    ),
    User(
      id: '1',
      name: 'John Doe',
      email: 'dah',
      phone: '1234567890',
      img: 'nooo',
    ),
    User(
      id: '1',
      name: 'John Doe',
      email: 'dah',
      phone: '1234567890',
      img: 'nooo',
    ),
    User(
      id: '1',
      name: 'John Doe',
      email: 'dah',
      phone: '1234567890',
      img: 'nooo',
    ),
  ];

  Future<void> putUsers() async {
    final database = FirebaseFirestore.instance;
    for (User i in list) {
      final ref = database.collection('users').doc();
      final n = i.copyWith(id: ref.id);
      await ref
          .set(n.toJson())
          .then((vsla) {
            debugPrint('User added: ${n.name}');
          })
          .catchError((error) {
            debugPrint("Error adding user: $error");
          });
    }
  }
}
