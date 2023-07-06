
class UserInfoModel{
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? location;
  String? phone;
  String? picture;

  UserInfoModel({
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.phone,
    this.location,
    this.picture
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json){
    return UserInfoModel(
      firstName: json['name']['first'],
      lastName: json['name']['last'],
      gender: json['gender'],
      email: json['email'],
      phone: json['phone'],
      location: json['location']['country'],
      picture: json['picture']['large'],
    );
  }
}
