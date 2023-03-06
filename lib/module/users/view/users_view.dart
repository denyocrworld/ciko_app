import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ciko_chat/core.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);

  Widget build(context, UsersController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("users").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (snapshot.data == null) return Container();
                  if (snapshot.data!.docs.isEmpty) {
                    return const Text("No Data");
                  }
                  final data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item =
                          (data.docs[index].data() as Map<String, dynamic>);
                      item["id"] = data.docs[index].id;

                      if (item["id"] ==
                          FirebaseAuth.instance.currentUser!.uid) {
                        return Container();
                      }

                      return Card(
                        child: ListTile(
                          onTap: () {
                            Get.to(ChatDetailView(
                              user: item,
                            ));
                          },
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            backgroundImage: NetworkImage(item["photo"]),
                          ),
                          title: Text(item["name"]),
                          subtitle: Text(item["email"]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<UsersView> createState() => UsersController();
}
