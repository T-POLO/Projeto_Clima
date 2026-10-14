import 'package:flutter/material.dart';

// "stf" + TAB cria um StatefulWidget

class SobreView extends StatefulWidget {
  const SobreView({super.key});

  @override
  State<SobreView> createState() => _SobreViewState();
}

class _SobreViewState extends State<SobreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Botão de perfil
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'Perfil');
                },
                icon: const Icon(
                  Icons.account_circle_outlined,
                  size: 42,
                  color: Color(0xFF26374A),
                ),
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                tooltip: 'Perfil',
              ),

              const SizedBox(height: 30),

              // Botão Clima
              _buildBotao(
                icone: Icons.cloud_outlined,
                titulo: 'Clima',
                trailing: const Text(
                  '25°C',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF26374A),
                  ),
                ),
                onTap: () {
                  // Abrir detalhes do clima
                },
              ),

              const SizedBox(height: 16),

              // Botão Nível de alerta
              _buildBotao(
                icone: Icons.warning_amber_rounded,
                titulo: 'Nível de alerta',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 12,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Normal',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  // Abrir detalhes do nível de alerta
                },
              ),

              const SizedBox(height: 16),

              // Botão Mapa
              _buildBotao(
                icone: Icons.public,
                titulo: 'Mapa',
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Color(0xFF7B8794),
                ),
                onTap: () {
                  // Abrir a tela do mapa
                },
              ),

              const SizedBox(height: 16),

              _buildBotao(
                icone: Icons.public,
                titulo: 'Sobre',
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Color(0xFF7B8794),
                ),
                onTap: () {
                 showDialog(context: context,
                 builder: (BuildContext context) => AlertDialog(
                   title: const Text("Sobre a gente"),
                    content: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('• Nome da Disciplina: Programa para dispositivos móveis'),
                      SizedBox(height: 6),
                      Text('• Instituição: Faculdade de Tecnologia de Ribeirão Preto'),
                      SizedBox(height: 6),
                      Text('• Professor: Rodrigo Plotze'),
                      SizedBox(height: 6),
                      Text('• Versão do aplicativo: 0.5.0'),
                      SizedBox(height: 6),
                      Text('• Alunos: Tiago Sanches Polo (2840482511016) e Claudio Mauricio Bispo Junior (2840482421007)'),
                     ],
                   )
                  ),
                 );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget reutilizável para os botões
  Widget _buildBotao({
    required IconData icone,
    required String titulo,
    required Widget trailing,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 85,
      child: Card(
        elevation: 2,
        shadowColor: Colors.black12,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                Icon(
                  icone,
                  size: 30,
                  color: const Color(0xFF247BA0),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF26374A),
                    ),
                  ),
                ),
                trailing,
              ],
            ),
          ),
        ),
      ),
    );
  }
}