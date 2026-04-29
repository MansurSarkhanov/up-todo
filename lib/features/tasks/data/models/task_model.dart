import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
    required this.dueDate,
    required this.priority,
    required this.category,
    required this.createDate,
    this.isCompleted = false,
  });

  factory Task.fromJson(Map<String, dynamic> json, String id) {
    return Task(
      id: id,
      title: json['title'] as String,
      description: json['description'] as String,
      userId: json['userId'] as String,
      dueDate: (json['dueDate'] as Timestamp).toDate(),
      priority: json['priority'] as int,
      isCompleted: json['isCompleted'] as bool,
      createDate: (json['createdAt'] as Timestamp).toDate(),
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
    );
  }
  final String id;
  final String title;
  final String description;
  final String userId;
  final DateTime dueDate;
  final int priority;
  final bool isCompleted;
  final DateTime createDate;
  final Category category;

  Task copyWith({
    String? id,
    String? title,
    String? description,
    String? userId,
    DateTime? dueDate,
    int? priority,
    bool? isCompleted,
    DateTime? createDate,
    Category? category,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      userId: userId ?? this.userId,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
      createDate: createDate ?? this.createDate,
      category: category ?? this.category,
    );
  }
}

class Category {
  Category({required this.name, required this.icon});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(name: json['name'] as String, icon: json['icon'] as String);
  }
  final String name;
  final String icon;
}
