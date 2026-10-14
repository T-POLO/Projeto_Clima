import 'package:flutter/material.dart';

class SobreController extends ChangeNotifier {

  void abrirPerfil(BuildContext context) {
    Navigator.pushNamed(
      context,
      'perfil',
    );
  }

}