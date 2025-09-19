import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/signup_usecase.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUseCase signupUseCase;

  SignupBloc({
    required this.signupUseCase
  }) : super(SignupInitial()){
    on<SignupSubmitted>((event, emit) async {
      emit(SignupLoading());
      final result = await signupUseCase(SignupParams(email: event.email, password: event.password, name: event.repassword));
      result.fold(
            (failure) => emit(const SignupFailure('sign up failed')),
            (user) => emit(SignupSuccess(user)),
      );
    });
  }
}