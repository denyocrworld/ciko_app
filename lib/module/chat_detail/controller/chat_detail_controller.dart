import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ciko_chat/state_util.dart';
import '../view/chat_detail_view.dart';

class ChatDetailController extends State<ChatDetailView>
    implements MvcController {
  static late ChatDetailController instance;
  late ChatDetailView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String get convertationId {
    var yourUid = FirebaseAuth.instance.currentUser!.uid;
    var userUid = widget.user["id"];

    List arr = [
      yourUid,
      userUid,
    ];
    arr.sort();
    return arr[0] + "-" + arr[1];
  }
}
