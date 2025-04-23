import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // --------------------- AUTENTICAÇÃO ---------------------
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw handleAuthError(e);
    }
  }

  Future<User?> signUp(String email, String password, String name) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Agora salva o NAME em vez do email
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'name': name, // ✅ Alterado para nome
        'createdAt': FieldValue.serverTimestamp(),
      });

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw handleAuthError(e);
    }
  }

  // Novo método para pegar o nome do usuário
  Future<String?> getUserName() async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return null;

    final doc = await _firestore.collection('users').doc(userId).get();
    return doc['name']; // Retorna o nome ou null
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  // --------------------- FAVORITOS ---------------------
  Future<void> saveFavorite({
    required String recipeId,
    required Map<String, dynamic> recipeData,
  }) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) throw Exception("Usuário não logado!");

    await _firestore.collection('favorites').doc('${userId}_$recipeId').set({
      ...recipeData,
      'userId': userId,
      'recipeId': recipeId,
      'savedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> removeFavorite(String recipeId) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) throw Exception("Usuário não logado!");

    await _firestore
        .collection('favorites')
        .doc('${userId}_$recipeId')
        .delete();
  }

  Future<bool> isFavorite(String recipeId) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return false;

    final doc =
        await _firestore
            .collection('favorites')
            .doc('${userId}_$recipeId')
            .get();

    return doc.exists;
  }

  Stream<List<Map<String, dynamic>>> getFavorites() {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return const Stream.empty();

    return _firestore
        .collection('favorites')
        .where('userId', isEqualTo: userId)
        .orderBy('savedAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  // --------------------- LISTA DE COMPRAS ---------------------
  Future<void> addToShoppingList(List<String> items) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) throw Exception("Usuário não logado!");

    await _firestore.collection('shoppingLists').doc(userId).set({
      'items': FieldValue.arrayUnion(items),
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Stream<List<String>> getShoppingList() {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return const Stream.empty();

    return _firestore
        .collection('shoppingLists')
        .doc(userId)
        .snapshots()
        .map((doc) => List<String>.from(doc.data()?['items'] ?? []));
  }

  // --------------------- UTILITÁRIOS ---------------------
  String handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return 'Senha muito fraca (mínimo 6 caracteres)';
      case 'email-already-in-use':
        return 'E-mail já cadastrado';
      case 'invalid-email':
        return 'E-mail inválido';
      case 'user-not-found':
      case 'wrong-password':
        return 'E-mail ou senha incorretos';
      case 'too-many-requests':
        return 'Muitas tentativas. Tente novamente mais tarde';
      default:
        return 'Erro: ${e.message}';
    }
  }

  User? get currentUser => _auth.currentUser;
}
