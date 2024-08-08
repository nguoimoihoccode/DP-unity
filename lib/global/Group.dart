import 'package:ideco_app/global/CreateBy.dart';
import 'package:ideco_app/global/Customer.dart';

class Group {
  final String id;
  final Customer customer;
  final String groupname;
  final String logo;
  final String title;
  final String description;
  final String color;
  final String keyperson;
  final int number;
  final CreatedBy createdBy;
  final String createdAt;
  final String updatedAt;
  final int v;

  Group({
    required this.id,
    required this.customer,
    required this.groupname,
    required this.logo,
    required this.title,
    required this.description,
    required this.color,
    required this.keyperson,
    required this.number,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['_id'],
      customer: Customer.fromJson(json['customer']),
      groupname: json['groupname'],
      logo: json['logo'],
      title: json['title'],
      description: json['description'],
      color: json['color'],
      keyperson: json['keyperson'],
      number: json['number'],
      createdBy: CreatedBy.fromJson(json['createdBy']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
