import 'package:flutter/material.dart';
import 'package:ciko_chat/state_util.dart';
import '../view/users_view.dart';

class UsersController extends State<UsersView> implements MvcController {
  static late UsersController instance;
  late UsersView view;

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