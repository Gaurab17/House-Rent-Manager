class UserModel{
  String? uid;
  String? email;
  String? fullname;
  String? mobilenumber;
  String? address;
  

  UserModel({this.uid,this.email,this.fullname,this.mobilenumber,this.address});
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email:map['email'],
      fullname: map['fullname'],
      mobilenumber: map['mobilenumber'],
      address: map['address'],
      

    );
  }
  Map<String,dynamic>toMap(){
    return {
      'uid':uid,
    'email':email,
    'fullname':fullname,
    'mobilenumber':mobilenumber,
    'address': address,
    };
  }


}
