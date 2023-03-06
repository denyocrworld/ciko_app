import 'package:firebase_auth/firebase_auth.dart';
import 'package:ciko_chat/app_session.dart';
import 'package:flutter/material.dart';
import 'package:ciko_chat/core.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';
import '../controller/room_detail_controller.dart';

class RoomDetailView extends StatefulWidget {
  final Map room;
  const RoomDetailView({
    Key? key,
    required this.room,
  }) : super(key: key);

  Widget build(context, RoomDetailController controller) {
    controller.view = this;
    bool isHost = room["host"]["uid"] == FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: Text("#${room["id"]}"),
        actions: const [],
      ),
      body: SafeArea(
        child: ZegoUIKitPrebuiltLiveAudioRoom(
          appID: AppSession.appId,
          appSign: AppSession.appSign,
          userID: AppSession.userId,
          userName: AppSession.userName,
          roomID: room["id"],
          config: isHost
              ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
              : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience(),
        ),
      ),
    );
  }

  @override
  State<RoomDetailView> createState() => RoomDetailController();
}
