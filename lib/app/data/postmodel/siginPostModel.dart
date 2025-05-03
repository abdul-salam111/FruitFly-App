// To parse this JSON data, do
//
//     final registerUserModel = registerUserModelFromJson(jsonString);

import 'dart:convert';

SignInModel registerUserModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String registerUserModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {

    final String? email;
    final String? password;

    SignInModel({

        this.email,
        this.password,
    });

    factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(

        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {

        "email": email,
        "password": password,
    };
}
