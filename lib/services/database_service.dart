import 'package:cloud_firestore/cloud_firestore.dart';

const String USER_COLLECTIN = "Users";
const String CHAT_COLLECTIN = "Chats";
const String MESSAGES_COLLECTIN = "Messages";

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DatabaseService() {}
  Future<void> createUser(
      String _uid, String _email, String _name, String _imageURL) async {
    try {
      await _db.collection(USER_COLLECTIN).doc(_uid).set(
        {
          "email": _email,
          "image": _imageURL,
          "Last_active": DateTime.now().toUtc(),
          "name": _name,
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<DocumentSnapshot> getUsers(String uid) {
    return _db.collection(USER_COLLECTIN).doc(uid).get();
  }

  Future<void> updateUserLastSeenTime(String uid) async {
    try {
      await _db.collection(USER_COLLECTIN).doc(uid).update(
        {
          "Last_active": DateTime.now().toUtc(),
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
