class UserModel {
  final String userName;
  final String phoneNumber;
  final String email;
  final String? profileUrl;
  final String uid;

  UserModel({
    required this.email,
    required this.phoneNumber,
    required this.uid,
    this.profileUrl,
    required this.userName,
  });

  Map<String, dynamic> toMap() {
    return {
      "userName": userName,
      "uid": uid,
      "phoneNumber": phoneNumber,
      "email": email,
      "profilepic": profileUrl ?? "",
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: map["email"] ?? "",
        phoneNumber: map["phoneNumber"] ?? "",
        uid: map["uid"]??"",
        userName: map["userName"],
        profileUrl:map["profilepic"]??"");
  }

  get profilePic => null;
}
