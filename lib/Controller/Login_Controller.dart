import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController senhaController =
      TextEditingController();

  final RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)$",
  );

  bool _carregando = false;

  bool get carregando => _carregando;

  void setCarregando(bool valor) {
    _carregando = valor;
    notifyListeners();
  }

  // Função para fazer login
  Future<void> fazerLogin(BuildContext context) async {
    final email = emailController.text.trim();
    final senha = senhaController.text.trim();

    // Verifica se os campos estão vazios
    if (email.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha o email e a senha.'),
        ),
      );

      return;
    } else if (!emailRegExp.hasMatch(email.trim())){
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha com um email válido'),
        ),
      );

      return;
    }

    setCarregando(true);

    // Simula o processo de login
    await Future.delayed(
      const Duration(seconds: 1),
    );

    // Verifica se a tela ainda está ativa
    if (!context.mounted) {
      setCarregando(false);
      return;
    }

    setCarregando(false);

    // Vai para a página SobreView
    
    Navigator.pushReplacementNamed(
      context,
      'sobre',
    );
  }

  // Ir para a página de cadastro
  void irParaCadastro(BuildContext context) {
    Navigator.pushNamed(
      context,
      'cadastro_usuario',
    );
  }

  // Ir para a página de recuperação de senha
  void recuperarSenha(BuildContext context) {
    Navigator.pushNamed(
      context,
      'recuperar_senha',
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();

    super.dispose();
  }
}