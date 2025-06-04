import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? id;
  final String name;
  final String username;
  final String email;
  final String phone;

  User({
    this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
  });

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

    return User(
      id: doc.id,
      name: data?['name'] ?? 'Unknown',
      username: data?['username'] ?? 'Unknown',
      email: data?['email'] ?? 'No email',
      phone: data?['phone'] ?? 'No phone',
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'], // Make sure ID is properly set
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
    };
  }
}
