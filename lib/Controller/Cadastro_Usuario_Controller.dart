import 'package:flutter/material.dart';

class CadastroUsuarioController {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController senhaconController = TextEditingController();

  final RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)$",
  );

  String mensagem = '';

  // Valida os campos e realiza o cadastro
  bool cadastrarUsuario() {
    if (nomeController.text.trim().isEmpty ||
        telController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        senhaController.text.trim().isEmpty ||
        senhaconController.text.trim().isEmpty) {
      mensagem = 'Preencha todos os campos necessários';
      return false;
    }

    if (senhaController.text != senhaconController.text) {
      mensagem = 'Senhas Divergentes';
      return false;
    }

    if (!emailRegExp.hasMatch(emailController.text.trim())) {
      mensagem = 'Email inválido';
      return false;
    }

    mensagem = '';
    return true;
  }

  // Libera os recursos dos campos
  void dispose() {
    nomeController.dispose();
    telController.dispose();
    emailController.dispose();
    senhaController.dispose();
    senhaconController.dispose();
  }
}