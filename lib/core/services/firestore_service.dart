import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/tasks/data/models/task_model.dart';

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

  Future<DocumentReference> addTodo({
    required String title,
    required String userId,
    String? description,
    required DateTime dueDate,
    required int priority,
  }) async {
    final result = await _todoRef.add({
      'title': title,
      'description': description,
      'userId': userId,
      'isCompleted': false,
      'createdAt': DateTime.now(),
      'dueDate': dueDate,
      'priority': priority,
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
