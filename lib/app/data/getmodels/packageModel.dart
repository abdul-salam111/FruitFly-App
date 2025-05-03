// To parse this JSON data, do
//
//     final packgesModel = packgesModelFromJson(jsonString);

import 'dart:convert';

PackgesModel packgesModelFromJson(String str) => PackgesModel.fromJson(json.decode(str));

String packgesModelToJson(PackgesModel data) => json.encode(data.toJson());

class PackgesModel {
    final bool? success;
    final String? message;
    final List<Payload>? payload;

    PackgesModel({
        this.success,
        this.message,
        this.payload,
    });

    factory PackgesModel.fromJson(Map<String, dynamic> json) => PackgesModel(
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
    final String? price;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Payload({
        this.id,
        this.title,
        this.description,
        this.price,
        this.createdAt,
        this.updatedAt,
    });

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
