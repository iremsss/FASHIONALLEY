//kayıt olma fonksiyonu burada bulunur
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //kayıt ol fonksiyonu
  Future<User?> createPerson(String name, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore
        .collection("Person")
        .doc(user.user!.uid)
        .set({'userName': name, 'email': email});

    return user.user;
  }
}
