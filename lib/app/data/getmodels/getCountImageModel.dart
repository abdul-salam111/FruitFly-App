// To parse this JSON data, do
//
//     final getCountModel = getCountModelFromJson(jsonString);

import 'dart:convert';

GetCountModel getCountModelFromJson(String str) => GetCountModel.fromJson(json.decode(str));

String getCountModelToJson(GetCountModel data) => json.encode(data.toJson());

class GetCountModel {
    final bool? success;
    final String? message;
    final List<Payload>? payload;

    GetCountModel({
        this.success,
        this.message,
        this.payload,
    });

    factory GetCountModel.fromJson(Map<String, dynamic> json) => GetCountModel(
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
    final int? numberImageUpload;
    final int? userId;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final User? user;

    Payload({
        this.id,
        this.numberImageUpload,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.user,
    });

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        numberImageUpload: json["number_image_upload"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "number_image_upload": numberImageUpload,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
    };
}

class User {
    final int? id;
    final String? name;
    final String? email;
    final dynamic emailVerifiedAt;
    final dynamic profileImage;
    final dynamic profileImageUrl;
    final dynamic phone;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final List<Plan>? plans;

    User({
        this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.profileImage,
        this.profileImageUrl,
        this.phone,
        this.createdAt,
        this.updatedAt,
        this.plans,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        profileImage: json["profile_image"],
        profileImageUrl: json["profile_image_url"],
        phone: json["phone"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        plans: json["plans"] == null ? [] : List<Plan>.from(json["plans"]!.map((x) => Plan.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "profile_image": profileImage,
        "profile_image_url": profileImageUrl,
        "phone": phone,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "plans": plans == null ? [] : List<dynamic>.from(plans!.map((x) => x.toJson())),
    };
}

class Plan {
    final String? id;
    final String? title;
    final String? description;
    final String? price;
    final String? numberOfImages;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Pivot? pivot;

    Plan({
        this.id,
        this.title,
        this.description,
        this.price,
        this.numberOfImages,
        this.createdAt,
        this.updatedAt,
        this.pivot,
    });

    factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        numberOfImages: json["number_of_images"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "number_of_images": numberOfImages,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot?.toJson(),
    };
}

class Pivot {
    final int? userId;
    final String? planId;

    Pivot({
        this.userId,
        this.planId,
    });

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        planId: json["plan_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "plan_id": planId,
    };
}
