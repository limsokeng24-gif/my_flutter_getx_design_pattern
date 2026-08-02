import 'package:my_flutter_getx_design_pattern/app/cores/models/auth/LoginRequest.dart';
import 'package:my_flutter_getx_design_pattern/app/cores/models/auth/LoginResponse.dart';
import 'package:my_flutter_getx_design_pattern/app/cores/models/auth/RegisterRequest.dart';
import 'package:my_flutter_getx_design_pattern/app/cores/models/auth/RegisterResponse.dart';

abstract class ApiNetworkService {
  Future<LoginResponse> login(LoginRequest req);
  Future<RegisterResponse> register(RegisterRequest Gereq);
}