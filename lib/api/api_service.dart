
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:login_app/model/login_model.dart';
import 'package:login_app/model/signup_model.dart';

class LoginApiService{
 Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
   String url="https://reqres.in/api/login";

   final response = await http.post(url,body:requestModel.toJson());
 if(response.statusCode == 200 || response.statusCode == 400) {
   return LoginResponseModel.fromJson(json.decode(response.body));
 }else{
   throw Exception("failed to load data");
 }
 }
 }

class SignupApiService{
  Future<SignupResponseModel> register(SignupRequestModel requestModel) async {
    String url="https://reqres.in/api/register";

    final response = await http.post(url,body:requestModel.toJson());
    if(response.statusCode == 200 || response.statusCode == 400) {
      return SignupResponseModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("failed to post data");
    }
  }
}
