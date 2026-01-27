class ChatModel {
  int? id;
  String? name;
  MessageType? msgType;
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
    msgType = getMsgType(json["message_type"]);
    createdAt = json["created_at"];
  }
}

enum MessageType { VIDEO, GIF, TEXT }

MessageType getMsgType(String msgType) {
  switch (msgType) {
    case "video":
      return MessageType.VIDEO;
    case "gif":
      return MessageType.GIF;

    default:
      return MessageType.TEXT;
  }
}
