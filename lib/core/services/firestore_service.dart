import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _todoRef => _firestore.collection('todos');

  Future<void> addTodo({required String title, required String userId}) async {
    await _todoRef.add({
      'title': title,
      'userId': userId,
      'isCompleted': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getTodos(String userId) {
    return _todoRef
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots();
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
