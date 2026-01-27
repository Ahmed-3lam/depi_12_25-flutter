import 'package:depi_five/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chat_model.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChatModel> chats = chatsFromApi
        .map((e) => ChatModel.fromJson(e))
        .toList();
    return Scaffold(
      appBar: _homeAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          print("Hello From First App");
        },
        child: Icon(Icons.chat, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customChat(icon: Icons.lock, text: "Locked Chats"),
              SizedBox(height: 20),
              customChat(icon: Icons.archive, text: "Archived", count: 20),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: chats.length,
                itemBuilder: (context, index) => myChat(chats[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customChat({required IconData icon, required String text, int? count}) {
  return Row(
    children: [
      Icon(icon, color: Colors.green),
      SizedBox(width: 16),
      Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      Spacer(),
      if (count != null) Text("$count", style: TextStyle(color: Colors.green)),
    ],
  );
}

Widget myChat(ChatModel model) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Row(
      crossAxisAlignment: .start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.green,
          backgroundImage: NetworkImage(model.image ?? ""),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              model.name ?? "",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            msgBuilder(msgType: model.msgType!, msg: model.msg),
          ],
        ),
        Spacer(),
        Text(model.createdAt ?? ""),
      ],
    ),
  );
}

Widget msgBuilder({required MessageType msgType, String? msg}) {
  if (msgType == MessageType.VIDEO) {
    return Row(
      children: [
        Icon(CupertinoIcons.videocam_fill, color: Colors.grey),
        Text("Video"),
      ],
    );
  } else if (msgType == MessageType.GIF) {
    return Row(
      children: [
        Icon(Icons.gif, color: Colors.grey),
        Text("GIF"),
      ],
    );
  } else {
    return Text(msg ?? "");
  }
}

AppBar _homeAppBar() {
  return AppBar(
    backgroundColor: Colors.green,
    // leading: Icon(Icons.menu),
    title: Text(
      "WhatsApp",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    actions: [
      Icon(Icons.camera_alt_outlined, color: Colors.white),
      SizedBox(width: 10),
      Icon(Icons.search, color: Colors.white),
      SizedBox(width: 10),
      Icon(Icons.more_vert, color: Colors.white),
    ],
    centerTitle: false,
  );
}
