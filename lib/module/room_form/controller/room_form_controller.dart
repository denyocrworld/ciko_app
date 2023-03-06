import 'package:flutter/material.dart';
import 'package:ciko_chat/state_util.dart';
import '../../../service/room_service/room_service.dart';
import '../view/room_form_view.dart';

class RoomFormController extends State<RoomFormView> implements MvcController {
  static late RoomFormController instance;
  late RoomFormView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String roomName = "";
  doCreateRoom() async {
    await RoomService.createRoom(
      roomName: roomName,
    );
    Get.back();
  }
}
