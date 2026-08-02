// import 'package:get/get.dart';
// import 'package:my_flutter_getx_design_pattern/app/cores/models/auth/LoginRequest.dart';
// import 'package:my_flutter_getx_design_pattern/app/cores/models/auth/LoginResponse.dart';
// import 'package:my_flutter_getx_design_pattern/app/cores/models/auth/RegisterRequest.dart';
// import 'package:my_flutter_getx_design_pattern/app/cores/models/auth/RegisterResponse.dart';
// import 'package:my_flutter_getx_design_pattern/app/moduls/auth/repository/auth_repository.dart';
// import '../../../cores/network/api_network_service.dart';
//
// class AuthRepositoryImpl extends AuthRepository {
//   final apiNetworkService = Get.find<ApiNetworkService>();
//   @override
//   Future<LoginResponse> login({String? username, String? password}) async {
//     LoginRequest request = LoginRequest(
//       phoneNumber: username,
//       password: password,
//     );
//     return await apiNetworkService.login(request);
//   }
//
//   @override
//   Future<RegisterResponse> register({
//     String? username,
//     String? firstName,
//     String? lastName,
//     String? email,
//     String? phoneNumber,
//     String? password,
//     String? confirmPassword,
//     String? role,
//     String? profile,
//   }) async {
//     RegisterRequest Regrequest = RegisterRequest(
//       username: username,
//       firstName: firstName,
//       lastName: lastName,
//       email: email,
//       phoneNumber: phoneNumber,
//       password: password,
//       confirmPassword: confirmPassword,
//       role: role,
//       profile: profile
//     );
//     return await apiNetworkService.register(Regrequest);
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../cores/constants/constant_uri.dart';
import '../../../cores/models/auth/LoginRequest.dart';
import '../../../cores/models/auth/LoginResponse.dart';
import '../../../cores/models/auth/RegisterRequest.dart';
import '../../../cores/models/auth/RegisterResponse.dart';
import '../../../cores/network/api_network_service.dart';

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
