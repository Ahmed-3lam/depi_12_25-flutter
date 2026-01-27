class ChatModel {
  int? id;
  String? name;
  String? msgType;
  String? image;
  String? msg;
  String? createdAt;

  ChatModel({
    this.id,
    this.name,
    this.image,
    this.msg,
    this.msgType,
    this.createdAt,
  });

  ChatModel.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    msg = json["msg"];
    msgType = json["message_type"];
    createdAt = json["created_at"];
  }
}
