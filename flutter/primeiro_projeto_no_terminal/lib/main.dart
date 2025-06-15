import 'package:flutter/material.dart';
import 'package:primeiro_projeto/widgets/meu_widget_de_contador.dart';

void main() {
  runApp(
    SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: (Container(
            width: 250,
            height: 250,
            // color: Colors.blue,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(child: Text("Meu Conteudo")),
          )),
        ),
      ),
    ),
  );
}
