import 'package:connectivity_plus/connectivity_plus.dart';
import '../features/auth/data/datasources/auth_remote_datasource.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/usecases/login_usecase.dart';
import '../features/auth/domain/usecases/signup_usecase.dart';

class CoreBinding {
  static Connectivity getConnectivity() => Connectivity();
  static AuthRemoteDataSource getAuthRemoteDataSource() => AuthRemoteDataSourceImpl();
  static AuthRepositoryImpl getAuthRepository() => AuthRepositoryImpl(
    remoteDataSource : getAuthRemoteDataSource(),
    networkInfo : getConnectivity(),
  );
  static LoginUseCase getLoginUseCase() => LoginUseCase(getAuthRepository());
  static SignupUseCase getSignupUseCase() => SignupUseCase(getAuthRepository());
}
