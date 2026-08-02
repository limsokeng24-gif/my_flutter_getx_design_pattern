import 'dart:convert';

import 'package:my_flutter_getx_design_pattern/app/cores/constants/constant_uri.dart';
import 'package:my_flutter_getx_design_pattern/app/cores/models/auth/LoginRequest.dart';
import 'package:my_flutter_getx_design_pattern/app/cores/models/auth/LoginResponse.dart';
import 'package:my_flutter_getx_design_pattern/app/cores/network/api_network_service.dart';
import 'package:http/http.dart' as httpClient;

class ApiNetworkServiceImpl extends ApiNetworkService {
  var headers = {"Content-Type": "application/json"};
  @override
  Future<LoginResponse> login(LoginRequest req) async {
    LoginResponse loginResponse = LoginResponse();
    //URL
    var url = Uri.parse(ConstantUri.loginPath);
    //Call To Api
    var response = await httpClient.post(
      url,
      body: jsonEncode(req.toJson()),
      headers: headers,
    );
    //Check Condition status code
    if (response.statusCode == 200) {
      loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
    }
    return loginResponse;
  }
}
