// To parse this JSON data, do
//
//     final getNotificationsModel = getNotificationsModelFromJson(jsonString);

import 'dart:convert';

GetNotificationsModel getNotificationsModelFromJson(String str) => GetNotificationsModel.fromJson(json.decode(str));

String getNotificationsModelToJson(GetNotificationsModel data) => json.encode(data.toJson());

class GetNotificationsModel {
    final bool? success;
    final String? message;
    final List<Payload>? payload;

    GetNotificationsModel({
        this.success,
        this.message,
        this.payload,
    });

    factory GetNotificationsModel.fromJson(Map<String, dynamic> json) => GetNotificationsModel(
        success: json["success"],
        message: json["message"],
        payload: json["payload"] == null ? [] : List<Payload>.from(json["payload"]!.map((x) => Payload.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
    };
}

class Payload {
    final String? id;
    final String? title;
    final String? description;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Payload({
        this.id,
        this.title,
        this.description,
        this.createdAt,
        this.updatedAt,
    });

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
