// ignore: file_names
class AddFeildsModel {
  bool success;
  String message;
  Payload payload;

  AddFeildsModel({
    required this.success,
    required this.message,
    required this.payload,
  });
}

class Payload {
  String name;
  int userId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Payload({
    required this.name,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
}
