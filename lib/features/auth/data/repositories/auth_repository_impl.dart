import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final Connectivity networkInfo;

  AuthRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, User>> login({required String email, required String password}) async {
    try {
      final connectivityResult = await networkInfo.checkConnectivity();
      if (connectivityResult != ConnectivityResult.none) {
        final user = await remoteDataSource.login(email, password);
        return Right(user);
      }
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> signup({required String email, required String password, required String name}) async {
    try {
      final connectivityResult = await networkInfo.checkConnectivity();
      if (connectivityResult != ConnectivityResult.none) {
        final user = await remoteDataSource.signup(email, password, name);
        return Right(user);
      }
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}