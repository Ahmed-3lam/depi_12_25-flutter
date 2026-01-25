import 'package:depi_five/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _homeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            customChat(icon: Icons.lock, text: "Locked Chats"),
            SizedBox(height: 20),
            customChat(icon: Icons.archive, text: "Archived", count: 20),

            ListView.builder(
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) => myChat(
                image: imageList[index],
                name: nameList[index],
                createdAt: createdAtList[index],
              ),
            ),
          ],
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

Widget myChat({
  required String image,
  required String name,
  required String createdAt,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Row(
      crossAxisAlignment: .start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.green,
          backgroundImage: NetworkImage(image),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(CupertinoIcons.videocam_fill, color: Colors.grey),
                Text("Video"),
              ],
            ),
          ],
        ),
        Spacer(),
        Text(createdAt),
      ],
    ),
  );
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
