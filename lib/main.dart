import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';

import 'package:projeto_ui_ui/View/Cadastro_Usuario_View.dart';
import 'package:projeto_ui_ui/View/Login_View.dart';
import 'package:projeto_ui_ui/View/Perfil_View.dart';
import 'package:projeto_ui_ui/View/Recuperar_Senha_View.dart';
import 'package:projeto_ui_ui/View/Sobre_View.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APP',

      // Rotas do aplicativo
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginView(),
        'cadastro_usuario': (context) => CadastroUsuarioView(),
        'Perfil': (context) => PerfilView(),
        'recuperar_senha': (context) => RecuperarSenhaView(),
        'sobre': (context) => const SobreView(),
      },
    );
  }
}