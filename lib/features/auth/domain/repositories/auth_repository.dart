import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login ({required String email, required String password});
  Future<Either<Failure, User>> signup ({required String email, required String password, required String name});
}