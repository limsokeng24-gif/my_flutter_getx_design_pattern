import 'dart:convert';

import 'package:get/get.dart';
import '../../data/access_token.dart';
import '../constants/constant_uri.dart';
import '../models/auth/LoginRequest.dart';
import '../models/auth/LoginResponse.dart';
import '../models/auth/RefreshTokenRequest.dart';
import '../models/auth/RegisterRequest.dart';
import '../models/auth/RegisterResponse.dart';
import 'api_network_service.dart';

import 'package:http/http.dart' as httpClient;

class ApiNetworkServiceImpl extends ApiNetworkService {
  var headers = {"Content-Type": "application/json"};

  @override
  Future<LoginResponse> login(LoginRequest req) async {
    LoginResponse loginResponse = new LoginResponse();
    //URL
    var url = Uri.parse(ConstantUri.loginPath);
    //Call To api
    var response = await httpClient.post(
      url,
      body: jsonEncode(req.toJson()),
      headers: headers,
    );
    //Check Condition status code
    if (response.statusCode == 401) {
      return loginResponse;
    }
    //Mapping Respon
    if (response.statusCode == 200) {
      loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
    }
    return loginResponse;
  }

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    RegisterResponse registerResponse = RegisterResponse();

    var url = Uri.parse(ConstantUri.registerPath);

    var response = await httpClient.post(
      url,
      body: jsonEncode(request.toJson()),
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      registerResponse = RegisterResponse.fromJson(jsonDecode(response.body));
    }

    return registerResponse;
  }

  @override
  Future<bool> refreshToken() async {
    LoginResponse loginResponse = LoginResponse();
    //URL
    var url = Uri.parse(ConstantUri.loginPath);
    //Call To api
    var response = await httpClient.post(
      url,
      body: jsonEncode(
        RefreshTokenRequest(refreshToken: AccessToken.getRefreshToken()),
      ),
      headers: headers,
    );
    //Check Condition status code
    if (response.statusCode == 401) {
      AccessToken.removeToken();
      Get.offNamed("/login");
      return false;
    }
    //Mapping Respon
    if (response.statusCode == 200) {
      loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      AccessToken.saveToken(
        token: loginResponse.accessToken,
        refresh: loginResponse.refreshToken,
        username: loginResponse.user?.username,
      );
    }
    return true;
  }

  @override
  Future get(String url) async {
    dynamic responseBody;

    //URL
    var url = Uri.parse(ConstantUri.refreshPath);
    headers["Authorization"] = "Bearer ${AccessToken.getToken()}";
    //Call To api
    var response = await httpClient.post(url, headers: headers);
    if(response.statusCode ==200){
      responseBody = response.body;
    }
    if (response.statusCode == 401) {
      if (await refreshToken() == true) {
        headers["Authorization"] = "Bearer ${AccessToken.getToken()}";
        //Call To api
        var retryResponse = await httpClient.post(url, headers: headers);
        if(response.statusCode == 200){
          responseBody = retryResponse.body;
        }
      }
    }
    return responseBody;
  }

  @override
  Future post(String uri, dynamic body) async {
    var url = Uri.parse(uri);

    headers["Authorization"] = "Bearer ${AccessToken.getToken()}";

    var response = await httpClient.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }

    return null;
  }

  @override
  Future delete(String uri) async {
    var url = Uri.parse(uri);

    headers["Authorization"] = "Bearer ${AccessToken.getToken()}";

    var response = await httpClient.delete(
      url,
      headers: headers,
    );

    return response.statusCode == 200;
  }

  @override
  Future put(String uri, dynamic body) async {
    var url = Uri.parse(uri);

    headers["Authorization"] = "Bearer ${AccessToken.getToken()}";

    var response = await httpClient.put(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    print("PUT STATUS: ${response.statusCode}");
    print("PUT BODY: ${response.body}");

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      return true;
    }

    return null;
  }

}