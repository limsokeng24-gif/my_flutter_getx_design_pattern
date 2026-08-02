
import '../../../cores/models/auth/LoginResponse.dart';
import '../../../cores/models/auth/RegisterRequest.dart';
import '../../../cores/models/auth/RegisterResponse.dart';

abstract class AuthRepository {
  Future<LoginResponse> login({String? username, String? password});
  Future<RegisterResponse> register({
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? password,
    String? confirmPassword,
    String? role,
    String? profile,
  });
}