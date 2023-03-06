import 'package:ciko_chat/core.dart';
import 'package:flutter/material.dart';

class RoomsController extends State<RoomsView> implements MvcController {
  static late RoomsController instance;
  late RoomsView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  joinRoom(Map room) async {
    Get.to(RoomDetailView(
      room: room,
    ));
  }
}
