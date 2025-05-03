// To parse this JSON data, do
//
//     final signInResponseModel = signInResponseModelFromJson(jsonString);

import 'dart:convert';

SignInResponseModel signInResponseModelFromJson(String str) => SignInResponseModel.fromJson(json.decode(str));

String signInResponseModelToJson(SignInResponseModel data) => json.encode(data.toJson());

class SignInResponseModel {
    final bool? success;
    final String? message;
    final Payload? payload;

    SignInResponseModel({
        this.success,
        this.message,
        this.payload,
    });

    factory SignInResponseModel.fromJson(Map<String, dynamic> json) => SignInResponseModel(
        success: json["success"],
        message: json["message"],
        payload: json["payload"] == null ? null : Payload.fromJson(json["payload"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "payload": payload?.toJson(),
    };
}

class Payload {
    final String? token;
    final User? user;

    Payload({
        this.token,
        this.user,
    });

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
    };
}

class User {
    final int? id;
    final String? name;
    final String? email;
    final DateTime? emailVerifiedAt;
    final dynamic profileImage;
    final dynamic profileImageUrl;
    final dynamic phone;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final List<dynamic>? plans;

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
        emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
        profileImage: json["profile_image"],
        profileImageUrl: json["profile_image_url"],
        phone: json["phone"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        plans: json["plans"] == null ? [] : List<dynamic>.from(json["plans"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "profile_image": profileImage,
        "profile_image_url": profileImageUrl,
        "phone": phone,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "plans": plans == null ? [] : List<dynamic>.from(plans!.map((x) => x)),
    };
}
