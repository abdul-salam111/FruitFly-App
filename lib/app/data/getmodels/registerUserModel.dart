// To parse this JSON data, do
//
//     final registerUserModel = registerUserModelFromJson(jsonString);

import 'dart:convert';

RegisterUserModel registerUserModelFromJson(String str) => RegisterUserModel.fromJson(json.decode(str));

String registerUserModelToJson(RegisterUserModel data) => json.encode(data.toJson());

class RegisterUserModel {
    final String? name;
    final String? email;
    final String? password;

    RegisterUserModel({
        this.name,
        this.email,
        this.password,
    });

    factory RegisterUserModel.fromJson(Map<String, dynamic> json) => RegisterUserModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
    };
}
