class Customer {
  final String id;
  final String name;
  final String shortName;
  final String address;
  final String contactPerson;
  final String contactEmail;
  final String phone;
  final String taxCode;
  final String logo;
  final String? blockedAt;
  final String createdBy;
  final String createdAt;
  final String updatedAt;
  final int v;

  Customer({
    required this.id,
    required this.name,
    required this.shortName,
    required this.address,
    required this.contactPerson,
    required this.contactEmail,
    required this.phone,
    required this.taxCode,
    required this.logo,
    this.blockedAt,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['_id'],
      name: json['name'],
      shortName: json['shortName'],
      address: json['address'],
      contactPerson: json['contactPerson'],
      contactEmail: json['contactEmail'],
      phone: json['phone'],
      taxCode: json['taxCode'],
      logo: json['logo'],
      blockedAt: json['blockedAt'],
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
