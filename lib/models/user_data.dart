class UserModel {
  String? phonenumber;
  String? uid;
  String? email;
  String? name;

  UserModel({this.email, this.name, this.phonenumber, this.uid});

// receiving data from server

  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        phonenumber: map['phonenumber'],
        name: map['name'],
        email: map['email']);
  }
// sending data to our server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'phonenumber': phonenumber,
      'email': email,
      'name': name
    };
  }
}
