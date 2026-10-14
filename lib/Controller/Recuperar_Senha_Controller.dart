import 'package:flutter/material.dart';

class RecuperarSenhaController extends ChangeNotifier {
  final TextEditingController emailController =
      TextEditingController();

  String mensagem = '';

  bool get emailInvalido =>
      mensagem.startsWith('Por favor');

  void recuperarSenha() {
    final email = emailController.text.trim();

    if (email.isEmpty ||
        !email.contains('@') ||
        !email.contains('.')) {
      mensagem = 'Por favor, insira um email válido';
    } else {
      mensagem =
          'Um link de recuperação de senha foi enviado para seu email';
    }

    notifyListeners();
  }

  // Voltar para a tela anterior (Login)
  void voltarParaLogin(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}