import 'package:flutter/material.dart';
import 'package:ciko_chat/state_util.dart';
import '../view/room_detail_view.dart';

class RoomDetailController extends State<RoomDetailView>
    implements MvcController {
  static late RoomDetailController instance;
  late RoomDetailView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
