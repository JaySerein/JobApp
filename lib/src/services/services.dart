import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:job_app/src/services/api.dart';

class ApiServices {
  Dio dio = Dio();

  Future<Response?> register(
      String fullname, String email, String phone, String password) async {
    Map<dynamic, dynamic> param = {
      "fullname": fullname,
      "email": email,
      "phone": phone,
      "password": password,
    };
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    try {
      final response = await dio
          .post(JAPI.urlRegister,
              options: Options(headers: headers), data: jsonEncode(param))
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 201) {
        return response;
      }
    } catch (e) {
      if (e is DioException) {
        // ignore: avoid_print
        print(e.response!.statusCode);
        return e.response;
      }
    }
    return null;
  }

  Future<Response?> login(String email, String password) async {
    Map<dynamic, dynamic> param = {
      "email": email,
      "password": password,
    };
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    try {
      final response = await dio
          .post(JAPI.urlLogin,
              options: Options(headers: headers), data: jsonEncode(param))
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      if (e is DioException) {
        // ignore: avoid_print
        print(e.response!.statusCode);
        return e.response;
      }
    }
    return null;
  }
}
