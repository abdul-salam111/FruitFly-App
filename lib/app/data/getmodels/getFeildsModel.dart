// To parse this JSON data, do
//
//     final getfieldsModel = getfieldsModelFromJson(jsonString);

import 'dart:convert';

GetFieldsModel getfieldsModelFromJson(String str) =>
    GetFieldsModel.fromJson(json.decode(str));

String getfieldsModelToJson(GetFieldsModel data) => json.encode(data.toJson());

class GetFieldsModel {
  final bool? success;
  final String? message;
  final List<Payload>? payload;

  GetFieldsModel({
    this.success,
    this.message,
    this.payload,
  });

  factory GetFieldsModel.fromJson(Map<String, dynamic> json) => GetFieldsModel(
        success: json["success"],
        message: json["message"],
        payload: json["payload"] == null
            ? []
            : List<Payload>.from(
                json["payload"]!.map((x) => Payload.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "payload": payload == null
            ? []
            : List<dynamic>.from(payload!.map((x) => x.toJson())),
      };
}

class Payload {
  final int? id;
  final String? name;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Payload>? traps;
  final int? fieldId;

  Payload({
    this.id,
    this.name,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.traps,
    this.fieldId,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        traps: json["traps"] == null
            ? []
            : List<Payload>.from(
                json["traps"]!.map((x) => Payload.fromJson(x))),
        fieldId: json["field_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "traps": traps == null
            ? []
            : List<dynamic>.from(traps!.map((x) => x.toJson())),
        "field_id": fieldId,
      };
}
