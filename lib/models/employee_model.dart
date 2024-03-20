import 'package:mongo_dart/mongo_dart.dart';

class Employee {
  ObjectId? id;
  String name;
  int experience;
  bool active;

  Employee(
      {this.id,
      required this.name,
      required this.experience,
      required this.active});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['_id'],
      name: json['name'],
      experience: json['experience'],
      active: json['active'],
    );
  }
}
