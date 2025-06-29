import 'package:flutter/material.dart';
import 'package:primeiro_projeto/widgets/meu_widget_de_contador.dart';

void main() {
  runApp(
    SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.amber,
              height: 100,
              width: 80,
              child: Text("SizeBox"),
            ),
            Container(
              height: 90,
              width: double.infinity,
              color: Colors.blue,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Aperte aqui"),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
