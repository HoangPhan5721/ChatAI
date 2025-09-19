import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/binding.dart';
import '../bloc/login/login_bloc.dart';

class LoginBinding {
  static LoginBloc createBloc(SharedPreferences sharedPreferences) {
    return LoginBloc(loginUseCase: CoreBinding.getLoginUseCase());
  }
}


