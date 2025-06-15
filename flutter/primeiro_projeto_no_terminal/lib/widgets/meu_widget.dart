import 'package:flutter/material.dart';

class MeuPrimeiroWidget extends StatelessWidget {
  final String meuTexto;
  final Color? minhaCor;
  const MeuPrimeiroWidget({
    super.key,
    required this.meuTexto,
    required this.minhaCor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(meuTexto, style: TextStyle(color: minhaCor));
  }
}
