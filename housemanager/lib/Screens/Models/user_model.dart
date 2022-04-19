class UserModel {
  String? uid;
  String? email;
  String? fullname;
  String? mobilenumber;
  String? address;
  String? hid;

  UserModel(
      {this.uid,
      this.email,
      this.fullname,
      this.mobilenumber,
      this.address,
      this.hid});
  factory UserModel.formMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullname: map['fullname'],
      mobilenumber: map['mobilenumber'],
      address: map['address'],
      hid: map['hid'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullname': fullname,
      'mobilenumber': mobilenumber,
      'address': address,
      'hid': hid,
    };
  }
}
