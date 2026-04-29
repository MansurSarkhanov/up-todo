import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.isOnline,
    required this.createdAt,
    required this.lastSeen,
    required this.activeCount,
    required this.completedCount,
    this.photoUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      username: map['username'] as String?,
      email: map['email'] as String,
      photoUrl: map['photoUrl'] as String?,
      isOnline: map['isOnline'] as bool,
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      lastSeen: map['lastSeen'] != null
          ? (map['lastSeen'] as Timestamp).toDate()
          : DateTime.now(),
      activeCount: (map['activeCount'] ?? 0) as int,
      completedCount: (map['completedCount'] ?? 0) as int,
    );
  }
  final String id;
  final String? username;
  final String email;
  final String? photoUrl;
  final bool isOnline;
  final DateTime createdAt;
  final DateTime lastSeen;
  final int activeCount;
  final int completedCount;

  /// copyWith metodu
  UserModel copyWith({
    String? username,
    String? email,
    String? photoUrl,
    bool? isOnline,
    DateTime? createdAt,
    DateTime? lastSeen,
    int? activeCount,
    int? completedCount,
  }) {
    return UserModel(
      id: id,
      username: username ?? this.username,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      isOnline: isOnline ?? this.isOnline,
      createdAt: createdAt ?? this.createdAt,
      lastSeen: lastSeen ?? this.lastSeen,
      activeCount: activeCount ?? this.activeCount,
      completedCount: completedCount ?? this.completedCount,
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
    activeCount,
    completedCount,
  ];
}
