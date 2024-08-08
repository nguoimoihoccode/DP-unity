class CreatedBy {
  final String username;
  final String fullname;
  final String role;
  final String email;
  final String avatar;
  final String cover;
  final String status;
  final String userClass;
  final String customer;
  final dynamic project;
  final dynamic group;
  final bool isKey;
  final String projectrole;
  final bool active;
  final String about;
  final String phone;
  final String dataMode;
  final String denseMode;
  final String partnership;
  final dynamic blockedAt;
  final String activeCode;
  final String createdAt;
  final String updatedAt;
  final String id;

  CreatedBy({
    required this.username,
    required this.fullname,
    required this.role,
    required this.email,
    required this.avatar,
    required this.cover,
    required this.status,
    required this.userClass,
    required this.customer,
    this.project,
    this.group,
    required this.isKey,
    required this.projectrole,
    required this.active,
    required this.about,
    required this.phone,
    required this.dataMode,
    required this.denseMode,
    required this.partnership,
    this.blockedAt,
    required this.activeCode,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return CreatedBy(
      username: json['username'],
      fullname: json['fullname'],
      role: json['role'],
      email: json['email'],
      avatar: json['avatar'],
      cover: json['cover'],
      status: json['status'],
      userClass: json['class'],
      customer: json['customer'],
      project: json['project'],
      group: json['group'],
      isKey: json['isKey'],
      projectrole: json['projectrole'],
      active: json['active'],
      about: json['about'],
      phone: json['phone'],
      dataMode: json['dataMode'],
      denseMode: json['denseMode'],
      partnership: json['partnership'],
      blockedAt: json['blockedAt'],
      activeCode: json['activeCode'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      id: json['id'],
    );
  }
}
