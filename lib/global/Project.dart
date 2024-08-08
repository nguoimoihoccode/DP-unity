class Project {
  final String id;
  final String customer;
  final String name;
  final String category;
  final String address;
  final String description;
  final String note;
  final int star;
  final String avatar;
  final String createdBy;
  final String? blockedAt;
  final String createdAt;
  final String updatedAt;
  final int v;

  Project({
    required this.id,
    required this.customer,
    required this.name,
    required this.category,
    required this.address,
    required this.description,
    required this.note,
    required this.star,
    required this.avatar,
    required this.createdBy,
    this.blockedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['_id'],
      customer: json['customer'],
      name: json['name'],
      category: json['category'],
      address: json['address'],
      description: json['description'],
      note: json['note'],
      star: json['star'],
      avatar: json['avatar'],
      createdBy: json['createdBy'],
      blockedAt: json['blockedAt'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
