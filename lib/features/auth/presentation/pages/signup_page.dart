import 'package:clean_architecture_tdd_course/features/auth/presentation/bloc/signup/signup_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/binding.dart';
import '../bloc/signup/signup_bloc.dart';
import '../bloc/signup/signup_state.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repassController = TextEditingController();
  final phoneNumber = TextEditingController();
  final address = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    repassController.dispose();
    phoneNumber.dispose();
    address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: BlocProvider(
          create: (context) =>
              SignupBloc(signupUseCase: CoreBinding.getSignupUseCase()),
          child: BlocListener<SignupBloc, SignupState>(
            listener: (context, state) {
              if (state is SignupFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
              if (state is SignupSuccess) {
                Navigator.pushReplacementNamed(context, "/login");
              }
            },
            child:
                BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
              if (state is SignupLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(children: [
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: "Email"),
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(labelText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(isPasswordVisible
                            ? Icons.visibility :
                              Icons.visibility_off
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        )
                      ),
                    ),
                    TextField(
                      controller: repassController,
                      decoration: InputDecoration(
                        labelText: "Verify your password",
                        suffixIcon: IconButton(
                          icon: Icon(isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  SizedBox(height: 20),
                  FloatingActionButton(
                      onPressed: (){
                        context.read<SignupBloc>().add (
                          SignupSubmitted(email: emailController.text.trim(), password: passwordController.text.trim(), repassword: repassController.text.trim())
                        );
                      },
                    foregroundColor: Colors.deepOrange,
                    backgroundColor: Colors.yellow,
                    child: const Icon(Icons.navigation),
                  )
                  ]));
            }),
          )),
    );
  }
}
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         context.read<LoginBloc>().add(
//                           LoginSubmitted(
//                             email: emailController.text.trim(),
//                             password: passwordController.text.trim(),
//                           ),
//                         );
//                       },
//                       child: const Text("Login"),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
