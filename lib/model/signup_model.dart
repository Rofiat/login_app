
class SignupResponseModel {
  final String token;
  final String error;

  SignupResponseModel({this.token, this.error});

  factory SignupResponseModel.fromJson(Map<String,dynamic> json){
    return SignupResponseModel(token:json["token"]!=null?json["token"]:"",error:json["error"]!=null?json["error"]:"");
  }
}

class SignupRequestModel{
  String email;
  String password;
  String confirm_password;

  SignupRequestModel({this.email,this.password,this.confirm_password});

  Map<String,dynamic> toJson(){
    Map<String,dynamic> map= {
      'email':email.trim(),
      'password':password.trim(),
      'confirm_password':confirm_password.trim(),
    };
    return map;
  }

}