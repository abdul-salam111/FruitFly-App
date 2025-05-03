// To parse this JSON data, do
//
//     final getFliesModel = getFliesModelFromJson(jsonString);

import 'dart:convert';

GetFliesModel getFliesModelFromJson(String str) => GetFliesModel.fromJson(json.decode(str));

String getFliesModelToJson(GetFliesModel data) => json.encode(data.toJson());

class GetFliesModel {
    final bool? success;
    final String? message;
    final List<Payload>? payload;

    GetFliesModel({
        this.success,
        this.message,
        this.payload,
    });

    factory GetFliesModel.fromJson(Map<String, dynamic> json) => GetFliesModel(
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
    final DateTime? dateTime;
    final int? quantity;
    final String? location;
    final String? image;
    final String? imageUrl;
    final int? userId;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Payload({
        this.id,
        this.title,
        this.description,
        this.dateTime,
        this.quantity,
        this.location,
        this.image,
        this.imageUrl,
        this.userId,
        this.createdAt,
        this.updatedAt,
    });

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        dateTime: json["date_time"] == null ? null : DateTime.parse(json["date_time"]),
        quantity: json["quantity"],
        location: json["location"],
        image: json["image"],
        imageUrl: json["image_url"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date_time": dateTime?.toIso8601String(),
        "quantity": quantity,
        "location": location,
        "image": image,
        "image_url": imageUrl,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
