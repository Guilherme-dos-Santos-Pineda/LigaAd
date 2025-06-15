import 'package:flutter/material.dart';
import 'package:primeiro_projeto/widgets/custom_button.dart';
import 'package:primeiro_projeto/widgets/custom_text_field.dart';
import 'package:primeiro_projeto/widgets/link_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Entrar'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Preencha suas informações abaixo',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              label: 'E-mail',
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Senha',
              obscureText: _obscurePassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              controller: _passwordController,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: LinkText(text: 'Esqueci minha senha', onTap: () {}),
            ),
            const SizedBox(height: 30),
            CustomButton(text: 'Entrar', onPressed: () {}),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Primeiro Acesso?'),
                const SizedBox(width: 5),
                LinkText(
                  text: 'Cadastre-se',
                  onTap: () => Navigator.pushNamed(context, '/register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
