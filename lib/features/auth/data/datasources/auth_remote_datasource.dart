import '../../domain/entities/user.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> signup(String email, String password, String name);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    // Mock implementation; replace with Firebase Auth
    if (email == 'test@test.com' && password == 'password') {
      return UserModel(id: '1', email: email, name: 'Test User');
    }
    throw Exception('Invalid credentials');
  }

  @override
  Future<UserModel> signup(String email, String password, String name) async {
    // Mock implementation
    return UserModel(id: '2', email: email, name: name);
  }
}
