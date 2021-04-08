import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

User userFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromJson(jsonData);
}

String userToJson(User data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class User {
  String userId;
  String firstName;
  String lastName;
  String number;
  String email;
  String location;
  String w_fl;
  String gender;

  User(
      {this.userId,
      this.firstName,
      this.lastName,
      this.number,
      this.email,
      this.location,
      this.w_fl,
      this.gender});

  factory User.fromJson(Map<String, dynamic> json) => new User(
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        number: json["number"],
        email: json["email"],
        location: json["email"],
        w_fl: json["w_fl"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "number": number,
        "email": email,
        "location": location,
        "w_fl": w_fl,
        "gender": gender
      };

  factory User.fromDocument(DocumentSnapshot doc) {
    return User.fromJson(doc.data);
  }
}
