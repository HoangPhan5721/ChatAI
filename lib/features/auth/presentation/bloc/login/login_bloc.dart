import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/login_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({
    required this.loginUseCase
  }) : super(LoginInitial()){
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      final result = await loginUseCase(LoginParams(email: event.email, password: event.password));
      result.fold(
            (failure) => emit(const LoginFailure('login failed')),
            (user) => emit(LoginSuccess(user)),
      );
    });
  }
}