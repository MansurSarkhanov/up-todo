import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String? username;
  final String email;
  final String? photoUrl;
  final bool isOnline;
  final DateTime createdAt;
  final DateTime lastSeen;

  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.photoUrl,
    required this.isOnline,
    required this.createdAt,
    required this.lastSeen,
  });

  /// Firestore snapshot-dan model yaratmaq
  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      photoUrl: map['photoUrl'],
      isOnline: map['isOnline'] ?? false,
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      lastSeen: map['lastSeen'] != null
          ? (map['lastSeen'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  /// Firestore-a göndərmək üçün map
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'photoUrl': photoUrl,
      'isOnline': isOnline,
      'createdAt': createdAt,
      'lastSeen': lastSeen,
    };
  }

  /// copyWith metodu
  UserModel copyWith({
    String? username,
    String? email,
    String? photoUrl,
    bool? isOnline,
    DateTime? createdAt,
    DateTime? lastSeen,
  }) {
    return UserModel(
      id: id,
      username: username ?? this.username,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      isOnline: isOnline ?? this.isOnline,
      createdAt: createdAt ?? this.createdAt,
      lastSeen: lastSeen ?? this.lastSeen,
    );
  }

  @override
  List<Object?> get props => [
    id,
    username,
    email,
    photoUrl,
    isOnline,
    createdAt,
    lastSeen,
  ];
}
