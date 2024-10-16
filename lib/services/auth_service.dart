import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream untuk mendengarkan perubahan status autentikasi
  Stream<User?> get user {
    return _auth.authStateChanges().map((user) {
      print('AuthService: User state changed - ${user?.uid}');
      return user;
    });
  }
  // Sign up with email and password
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User signed up: ${result.user?.uid}');
      return result.user;
    } catch (e) {
      print('Sign up error: $e');
      rethrow;
    }
  }

  // Sign in with email and password
  Future<User?> signIn(String email, String password) async {
  try {
    UserCredential result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('User signed in: ${result.user?.uid}');
    return result.user;
  } catch (e) {
    print('Sign in error: $e');
    rethrow;
  }
}

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
    print('User signed out');
  }
}