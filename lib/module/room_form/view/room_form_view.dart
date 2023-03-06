import 'package:flutter/material.dart';
import 'package:ciko_chat/core.dart';
import '../controller/room_form_controller.dart';

class RoomFormView extends StatefulWidget {
  const RoomFormView({Key? key}) : super(key: key);

  Widget build(context, RoomFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("RoomForm"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Room name',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "Your room name's",
                ),
                onChanged: (value) {
                  controller.roomName = value;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 74,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
          ),
          onPressed: () => controller.doCreateRoom(),
          child: const Text("Create"),
        ),
      ),
    );
  }

  @override
  State<RoomFormView> createState() => RoomFormController();
}
