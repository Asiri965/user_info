import 'dart:convert';

import 'package:http/http.dart';
import 'package:user_info/models/user_info_model.dart';

class ApiService{
  final endpoint = "https://randomuser.me/api/?results=5000";

  Future<List<UserInfoModel>> getData() async{
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['results'];
      List<UserInfoModel> users = body.map((json) => UserInfoModel.fromJson(json)).toList();
      return users;
    }
    else{
      throw Exception(response.statusCode);
    }
  }
}