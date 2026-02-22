import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id; // Firestore document id
  final String title;
  final String description;
  final String userId;
  final DateTime dueDate;
  final int priority; // 1-low, 2-medium, 3-high
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
    required this.dueDate,
    required this.priority,
    this.isCompleted = false,
  });

  // Firestore document -> Task object
  factory Task.fromJson(Map<String, dynamic> json, String id) {
    return Task(
      id: id,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      userId: json['userId'] ?? '',
      dueDate: (json['dueDate'] as Timestamp).toDate(),
      priority: json['priority'] ?? 1,
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  // Task object -> Firestore document
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'userId': userId,
      'dueDate': Timestamp.fromDate(dueDate),
      'priority': priority,
      'isCompleted': isCompleted,
    };
  }

  // CopyWith for easy updates
  Task copyWith({
    String? id,
    String? title,
    String? description,
    String? userId,
    DateTime? dueDate,
    int? priority,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      userId: userId ?? this.userId,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
