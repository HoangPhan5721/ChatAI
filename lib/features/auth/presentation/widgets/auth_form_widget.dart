import 'package:flutter/material.dart';

class AuthFormWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? nameController;
  final VoidCallback onSubmit;
  final String buttonText;

  const AuthFormWidget({
    Key? key,
    required this.emailController,
    required this.passwordController,
    this.nameController,
    required this.onSubmit,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        if (nameController != null)
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onSubmit,
          child: Text(buttonText),
        ),
      ],
    );
  }
}