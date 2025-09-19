import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupSubmitted extends SignupEvent {
  final String email;
  final String password;
  final String repassword;

  const SignupSubmitted({required this.email, required this.password, required this.repassword});

  @override
  List<Object> get props => [email, password, repassword];
}
