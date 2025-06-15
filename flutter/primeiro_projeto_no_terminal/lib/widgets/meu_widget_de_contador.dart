import 'package:flutter/material.dart';

class MeuWidgetDeContador extends StatefulWidget {
  final String texto;

  const MeuWidgetDeContador({super.key, required this.texto});

  @override
  State<MeuWidgetDeContador> createState() => _MeuWidgetDeContadorState();
}

class _MeuWidgetDeContadorState extends State<MeuWidgetDeContador> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${widget.texto} ${contador}"),
        ElevatedButton(
          onPressed: () {
            setState(() {
              contador = contador + 1;
              print(contador);
            });
          },
          child: Text("Clique Aqui!"),
        ),
      ],
    );
  }
}
