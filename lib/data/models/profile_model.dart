class ProfileModel {
  String? id;
  String? name;
  String? email;
  String? avatar;
  String? address;
  String? phoneNumber;
  String? type;
  String? gender;
  String? dateOfBirth;
  String? createdAt;
  String? avatarUrl;

  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.avatar,
    this.address,
    this.phoneNumber,
    this.type,
    this.gender,
    this.dateOfBirth,
    this.createdAt,
    this.avatarUrl,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    type = json['type'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    createdAt = json['created_at'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    data['address'] = address;
    data['phone_number'] = phoneNumber;
    data['type'] = type;
    data['gender'] = gender;
    data['date_of_birth'] = dateOfBirth;
    data['created_at'] = createdAt;
    data['avatar_url'] = avatarUrl;
    return data;
  }

  // Add this method
  ProfileModel copyWith({
    String? id,
    String? name,
    String? email,
    String? avatar,
    String? address,
    String? phoneNumber,
    String? type,
    String? gender,
    String? dateOfBirth,
    String? createdAt,
    String? avatarUrl,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      createdAt: createdAt ?? this.createdAt,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
