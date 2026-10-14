import 'package:flutter/material.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({super.key});

  @override
  State<PerfilView> createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  // Dados de exemplo do usuário
  final String nomeUsuario = 'Usuário';
  final String nomeCompleto = 'Nome Completo';
  final String email = 'usuario@email.com';
  final String telefone = '(11) 99999-9999';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              // Ícone de perfil e nome do usuário
              Row(
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 85,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      nomeUsuario,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              // Título das informações
              const Text(
                'Informações pessoais',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // Nome completo
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.person,
                  size: 28,
                  color: Colors.blue,
                ),
                title: const Text(
                  'Nome completo',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                subtitle: Text(
                  nomeCompleto,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),

              const Divider(),

              // Email
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.email,
                  size: 28,
                  color: Colors.blue,
                ),
                title: const Text(
                  'E-mail',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                subtitle: Text(
                  email,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),

              const Divider(),

              // Telefone
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.phone,
                  size: 28,
                  color: Colors.blue,
                ),
                title: const Text(
                  'Telefone',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                subtitle: Text(
                  telefone,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),

              const Spacer(),

              // Botão Sair
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      'login',
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'Sair',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}