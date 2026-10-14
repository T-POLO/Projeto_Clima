
import 'package:flutter/material.dart';
import '../Controller/Recuperar_Senha_Controller.dart';

class RecuperarSenhaView extends StatefulWidget {
  const RecuperarSenhaView({super.key});

  @override
  State<RecuperarSenhaView> createState() =>
      _RecuperarSenhaViewState();
}

class _RecuperarSenhaViewState
    extends State<RecuperarSenhaView> {
  late final RecuperarSenhaController controller;

  @override
  void initState() {
    super.initState();
    controller = RecuperarSenhaController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  // Seta de voltar
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                      tooltip: 'Voltar para Login',
                    ),
                  ),

                  // Título
                  const Text(
                    'Recuperar Senha',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Campo de email
                  TextField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Digite seu email',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Botão de recuperação
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.recuperarSenha,
                      child: const Text('Recuperar senha'),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Mensagem de retorno
                  if (controller.mensagem.isNotEmpty)
                    Text(
                      controller.mensagem,
                      style: TextStyle(
                        color: controller.emailInvalido
                            ? Colors.red
                            : Colors.green,
                        fontSize: 16,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
