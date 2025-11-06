class ProfileModel {
  String? id;
  String? name;
  String? email;
  String? avatar;
  String? address;
  String? phoneNumber;
  String? type;
  String?gender;
  String? dateOfBirth;
  String? createdAt;
  String? avatarUrl;

  ProfileModel(
      {this.id,
        this.name,
        this.email,
        this.avatar,
        this.address,
        this.phoneNumber,
        this.type,
        this.gender,
        this.dateOfBirth,
        this.createdAt,
        this.avatarUrl});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['type'] = this.type;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['created_at'] = this.createdAt;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}
