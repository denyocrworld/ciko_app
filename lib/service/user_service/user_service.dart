import 'package:ciko_chat/app_session.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:zego_zim/zego_zim.dart';

class UserService {
  //users
  static init() async {
    AppSession.userId = FirebaseAuth.instance.currentUser!.uid;
    AppSession.userName =
        FirebaseAuth.instance.currentUser!.displayName ?? "No Name";

    // await zimLogin();

    var snapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (snapshot.docs.isNotEmpty) return;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "uid": FirebaseAuth.instance.currentUser!.uid,
      "name": FirebaseAuth.instance.currentUser!.displayName,
      "email": FirebaseAuth.instance.currentUser!.email,
      "photo": FirebaseAuth.instance.currentUser!.photoURL,
    });
  }

  static zimLogin() async {
    ZIMUserInfo userInfo = ZIMUserInfo();
    userInfo.userID = AppSession.userId;
    userInfo.userName = AppSession.userName;

    try {
      var value = await ZIM.getInstance()!.login(userInfo);
      print("Zim login success!");
    } on PlatformException catch (err) {
      print(err.code); //Return the error code when login failed.
      print(err.message!); // Return t
    }
  }
}
