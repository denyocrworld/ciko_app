import 'package:flutter/material.dart';
import 'package:ciko_chat/core.dart';
import '../controller/chat_detail_controller.dart';

class ChatDetailView extends StatefulWidget {
  final Map user;
  const ChatDetailView({
    Key? key,
    required this.user,
  }) : super(key: key);

  Widget build(context, ChatDetailController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ChatDetail"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: const [],
        ),
      ),
    );
  }

  @override
  State<ChatDetailView> createState() => ChatDetailController();
}
