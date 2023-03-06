import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoomService {
  static createRoom({
    required String roomName,
  }) async {
    await FirebaseFirestore.instance.collection("rooms").add({
      "room_name": roomName,
      "host": {
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "name": FirebaseAuth.instance.currentUser!.displayName,
      },
    });
  }
}
