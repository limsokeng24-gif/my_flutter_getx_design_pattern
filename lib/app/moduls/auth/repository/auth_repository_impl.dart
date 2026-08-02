import 'package:get/get.dart';
import '../../../cores/models/auth/LoginRequest.dart';
import '../../../cores/models/auth/LoginResponse.dart';
import '../../../cores/models/auth/RegisterRequest.dart';
import '../../../cores/models/auth/RegisterResponse.dart';
import '../../../cores/network/api_network_service.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl  extends AuthRepository{
  final apiNetworkService = Get.find<ApiNetworkService>();
  @override
  Future<LoginResponse> login({String? username, String? password}) async{
    LoginRequest request = LoginRequest(
        phoneNumber: username,
        password: password
    );
    return await apiNetworkService.login(request);
  }

  @override
  Future<RegisterResponse>register({
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? password,
    String? confirmPassword,
    String? role,
    String? profile,
  }) async {
    RegisterRequest request = RegisterRequest(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      confirmPassword: confirmPassword,
      role: role,
      profile: profile,
    );


    return apiNetworkService.register(request);
  }

}