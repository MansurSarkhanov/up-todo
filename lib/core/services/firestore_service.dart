import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/tasks/data/models/task_model.dart';
import '../../features/user/data/models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _todoRef => _firestore.collection('todos');
  CollectionReference get _usersRef => _firestore.collection('users');
  Future<void> createUser({
    required String uid,
    required String email,
    required String? username,
  }) async {
    await _usersRef.doc(uid).set({
      'uid': uid,
      'email': email,
      'username': username,
      'photoUrl': '',
      'isOnline': true,
      'createdAt': FieldValue.serverTimestamp(),
      'lastSeen': FieldValue.serverTimestamp(),
    });
  }

  Stream<UserModel> getUser({required String uid}) {
    return _usersRef.doc(uid).snapshots().map((doc) {
      return UserModel.fromMap(doc.data()! as Map<String, dynamic>, doc.id);
    });
  }

  Future<void> updateUser({
    required String uid,
    String? username,
    String? photoUrl,
  }) async {
    await _usersRef.doc(uid).update({
      'username': username,
      'photoUrl': photoUrl,
      'lastSeen': FieldValue.serverTimestamp(),
    });
  }

  Future<DocumentReference> addTodo({
    required String title,
    required String userId,
    String? description,
    required DateTime dueDate,
    required int priority,
    required String categoryName,
    required String categoryIcon,
  }) async {
    final result = await _todoRef.add({
      'title': title,
      'description': description,
      'userId': userId,
      'isCompleted': false,
      'createdAt': DateTime.now(),
      'dueDate': dueDate,
      'priority': priority,
      'category': {'name': categoryName, 'icon': categoryIcon},
    });
    return result;
  }

  Stream<List<Task>> getTasksStream(String userId) {
    return _todoRef
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) {
                final data = doc.data();
                if (data == null) return null;
                return Task.fromJson(data as Map<String, dynamic>, doc.id);
              })
              .whereType<Task>()
              .toList(),
        );
  }

  Stream<Task> watchTask(String taskId) {
    return _todoRef.doc(taskId).snapshots().map((snapshot) {
      if (!snapshot.exists) {
        throw Exception('Task not found');
      }
      final data = snapshot.data()!;
      return Task.fromJson(data as Map<String, dynamic>, snapshot.id);
    });
  }

  Future<void> editTask({
    required String taskId,
    String? title,
    String? description,
    DateTime? dueDate,
    int? priority,
    String? categoryName,
    String? categoryIcon,
  }) async {
    final Map<String, dynamic> updateData = {};

    if (title != null) updateData['title'] = title;
    if (description != null) updateData['description'] = description;
    if (dueDate != null) updateData['dueDate'] = dueDate;
    if (priority != null) updateData['priority'] = priority;
    if (categoryName != null || categoryIcon != null) {
      updateData['category'] = {};
      if (categoryName != null) updateData['category']['name'] = categoryName;
      if (categoryIcon != null) updateData['category']['icon'] = categoryIcon;
    }
    print('update title: $title');
    print('update description: $description');
    print('update dueDate: $dueDate');
    print('update priority: $priority');
    print('update categoryName: $categoryName');
    print('update categoryIcon: $categoryIcon');

    if (updateData.isNotEmpty) {
      await _todoRef.doc(taskId).update(updateData);
    }
  }

  Future<void> updateTodo({
    required String docId,
    required bool isCompleted,
  }) async {
    await _todoRef.doc(docId).update({'isCompleted': isCompleted});
  }

  Future<void> deleteTodo(String docId) async {
    await _todoRef.doc(docId).delete();
  }
}
