import 'dart:convert';

import 'package:firstapp_bloc/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  /// USER List API
  final String userListAPI = 'https://reqres.in/api/users?page=1';

  ///
  /// Get User Data
  Future<UserModel> fetchUserList() async {
    try {
      http.Response response = await http.get(
        Uri.parse(userListAPI),
      );
      return UserModel.fromJson(jsonDecode(response.body));
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return UserModel.withError("Data not found / Connection issue");
    }
  }
}
