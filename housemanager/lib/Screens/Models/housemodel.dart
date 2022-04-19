class HouseModel{
  String? hid;
  

  HouseModel({this.hid});
  factory HouseModel.fromMap(map){
    return HouseModel(
      hid: map['hid'],
      

    );
  }
  Map<String,dynamic>toMap(){
    return {
      'hid':hid,
    
    };
  }


}