class UserClass {
  final String id;
  final String user;
  final String customer;
  final String uclass;
  final String expired;
  final String groupId;
  final String groupName;
  final String groupTitle;
  final bool isKey;
  final String? blockedAt;
  final String createdAt;
  final String updatedAt;
  final int v;

  UserClass({
    required this.id,
    required this.user,
    required this.customer,
    required this.uclass,
    required this.expired,
    required this.groupId,
    required this.groupName,
    required this.groupTitle,
    required this.isKey,
    this.blockedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserClass.fromJson(Map<String, dynamic> json) {
    return UserClass(
      id: json['_id'],
      user: json['user'],
      customer: json['customer'],
      uclass: json['uclass'],
      expired: json['expired'],
      groupId: json['groupId'],
      groupName: json['groupName'],
      groupTitle: json['groupTitle'],
      isKey: json['isKey'],
      blockedAt: json['blockedAt'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
