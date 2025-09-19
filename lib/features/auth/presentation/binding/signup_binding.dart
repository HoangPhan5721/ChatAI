import '../../../../core/binding.dart';
import '../bloc/signup/signup_bloc.dart';

class SignupBinding {
  static SignupBloc createBloc() {
    return SignupBloc(signupUseCase: CoreBinding.getSignupUseCase());
  }
}
