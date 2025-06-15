import 'package:flutter/material.dart';

class MeuBotaoPersonalizado extends StatelessWidget {
  final String textDoBotao;
  final Color? corDoBotao;
  const MeuBotaoPersonalizado({
    super.key,
    required this.textDoBotao,
    required this.corDoBotao,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(corDoBotao)),
      child: Text(textDoBotao),
    );
  }
}
