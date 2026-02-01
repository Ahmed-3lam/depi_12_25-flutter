import 'package:depi_five/const.dart';
import 'package:depi_five/whatsapp/chat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessangerScreen extends StatelessWidget {
  const MessangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChatModel> chats = chatsFromApiMessanger
        .map((e) => ChatModel.fromJson(e))
        .toList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: iconWrappedWithCircleAvatar(Icons.menu),
        ),
        title: Text(
          "Chats",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: false,
        actions: [
          iconWrappedWithCircleAvatar(Icons.camera_alt_outlined),
          SizedBox(width: 15),
          iconWrappedWithCircleAvatar(Icons.edit),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _searchField(),
              SizedBox(height: 20),
              _statusItems(chats),
              SizedBox(height: 20),

              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: chats.length,
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemBuilder: (context, index) => Row(
                  children: [
                    _imageWithStatus(chats, index),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          chats[index].name ?? "",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 150,
                              child: Text(
                                chats[index].msg ?? "",
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              chats[index].createdAt ?? "",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: .spaceAround,
          children: [
            _navItem(
              CupertinoIcons.chat_bubble_2_fill,
              "Chats",
              isSelected: true,
            ),
            _navItem(
              CupertinoIcons.video_camera_solid,
              "Calls",
              isSelected: false,
            ),
            _navItem(Icons.people, "People"),
            _navItem(Icons.settings, "Settings"),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String text, {bool isSelected = false}) {
    return Column(
      children: [
        Icon(icon, color: isSelected ? Colors.blue : null),
        Text(text, style: TextStyle(color: isSelected ? Colors.blue : null)),
      ],
    );
  }

  Widget _statusItems(List<ChatModel> chats) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 20),
        itemBuilder: (context, index) => Column(
          children: [
            _imageWithStatus(chats, index),

            Text(chats[index].name ?? ""),
          ],
        ),
      ),
    );
  }

  Stack _imageWithStatus(List<ChatModel> chats, int index) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(chats[index].image ?? ""),
        ),
        if (chats[index].isAvailable ?? false)
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(backgroundColor: Colors.green, radius: 10),
          ),
      ],
    );
  }

  Widget _searchField() {
    return Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }

  ///Method vs Widget

  Widget iconWrappedWithCircleAvatar(IconData icon) {
    return CircleAvatar(
      backgroundColor: Colors.grey.withValues(alpha: .1),
      child: Icon(icon),
    );
  }
}
