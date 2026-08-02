import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/constant_uri.dart';
import '../models/auth/LoginRequest.dart';
import '../models/auth/LoginResponse.dart';
import '../models/auth/RegisterRequest.dart';
import '../models/auth/RegisterResponse.dart';
import 'api_network_service.dart';

class ApiNetworkServiceImpl extends ApiNetworkService {
  var headers = {"Content-Type": "application/json"};
  @override
  Future<LoginResponse> login(LoginRequest req) async {
    LoginResponse loginResponse = LoginResponse();
    //URL
    var url = Uri.parse(ConstantUri.loginPath);
    //Call To API
    var response = await http.post(
      url,
      body: jsonEncode(req.toJson()),
      headers: headers,
    );
    //Check Condition status code
    if (response.statusCode == 401) {
      return loginResponse;
    }
    //Mapping Response
    if (response.statusCode == 200) {
      loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
    }
    return loginResponse;
  }

  @override
  Future<RegisterResponse> register(RegisterRequest req) async {
    RegisterResponse registerResponse = RegisterResponse();
    //URL
    var url = Uri.parse(ConstantUri.registerPath);
    //Call To API
    var response = await http.post(
      url,
      body: jsonEncode(req.toJson()),
      headers: headers,
    );

    //Mapping Response
    if (response.statusCode == 200 || response.statusCode == 201) {
      registerResponse = RegisterResponse.fromJson(jsonDecode(response.body));
    }
    return registerResponse;
  }
}