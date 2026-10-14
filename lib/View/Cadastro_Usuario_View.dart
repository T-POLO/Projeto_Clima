import 'package:flutter/material.dart';
// "stf" + TAB faz isso

class CadastroUsuarioView extends StatefulWidget {
  const CadastroUsuarioView({super.key});

  @override
  State<CadastroUsuarioView> createState() => _CadastroUsuarioViewState();
}

class _CadastroUsuarioViewState extends State<CadastroUsuarioView> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController senhaconController = TextEditingController();
  final RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",);
  String mensagem = '';

  void cadastrarUsuario() {
    if (nomeController.text.trim().isEmpty ||
        telController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        senhaController.text.trim().isEmpty ||
        senhaconController.text.trim().isEmpty) {
      setState(() {
        mensagem = 'Preencha todos os campos necessários';
      });
    } else if (senhaController.text != senhaconController.text){
      setState(() {
        mensagem = 'Senhas Divergentes';
      });
    } else if (!emailRegExp.hasMatch(emailController.text)){
        setState(() {
        mensagem = 'Email inválido';
    });
    } else {
      setState(() {
        mensagem = '';
    });
    Navigator.pushNamed(context, 'login');
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    telController.dispose();
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 30),

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
              const Text(
                'Cadastro de Usuário',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // Nome completo
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome completo',
                  hintText: 'Digite seu nome completo',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              // ID
              TextField(
                controller: telController,
                decoration: const InputDecoration(
                  labelText: 'Telefone',
                  hintText: 'Insira seu telefone',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              // Email
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Digite seu email',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              // Senha
              TextField(
                controller: senhaController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  hintText: 'Digite sua senha',
                  border: OutlineInputBorder(),
                ),
              ),
              
              const SizedBox(height: 15),

              // confirmar Senha
              TextField(
                controller: senhaconController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirmar senha',
                  hintText: 'Digite sua senha novamente',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // Mensagem de erro
              if (mensagem.isNotEmpty)
                Text(
                  mensagem,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),

              const SizedBox(height: 20),

              // Botão de cadastro
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: cadastrarUsuario,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Cadastre-se',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}