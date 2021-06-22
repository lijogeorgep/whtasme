// To parse this JSON data, do
//
//     final chatroom = chatroomFromMap(jsonString);

import 'dart:convert';

List<Chatroom> chatroomFromMap(String str) => List<Chatroom>.from(json.decode(str).map((x) => Chatroom.fromMap(x)));

String chatroomToMap(List<Chatroom> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Chatroom {
  Chatroom({
    this.id,
    this.name,
    this.image,
    this.status,
    this.message,
  });

  int id;
  String name;
  String image;
  String status;
  String message;

  factory Chatroom.fromMap(Map<String, dynamic> json) => Chatroom(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "image": image == null ? null : image,
    "status": status == null ? null : status,
    "message": message == null ? null : message,
  };
}
