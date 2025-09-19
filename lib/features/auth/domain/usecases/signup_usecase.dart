import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignupParams {
  final String email ;
  final String password;
  final String name;
  SignupParams({required this.email, required this.password, required this.name});
}

class SignupUseCase implements UseCase<User, SignupParams> {
  final AuthRepository repository;
  SignupUseCase(this.repository);
  @override
  Future<Either<Failure, User>> call(SignupParams params) async{
    return await repository.signup(email: params.email, password: params.password, name: params.name);
  }
}