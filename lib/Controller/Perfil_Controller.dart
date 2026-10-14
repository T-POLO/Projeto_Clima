import 'package:flutter/material.dart';

class PerfilController extends ChangeNotifier {

  void sair(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      'login',
      (route) => false,
    );
  }
}