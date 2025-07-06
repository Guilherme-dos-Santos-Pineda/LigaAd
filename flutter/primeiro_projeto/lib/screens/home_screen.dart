import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fundo branco
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Conteúdo principal
              Column(
                children: [
                  const SizedBox(height: 20),

                  // Logo
                  SizedBox(
                    width: 424,
                    height: 427,
                    child: Image.asset(
                      'assets/home/background.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Título
                  const Text(
                    'A Paz do Senhor Jesus',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: -1,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Subtítulo
                  const Text(
                    'Bem-vindo à Família AD Espírito Santo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SF Pro Text',
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Botões lado a lado
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Botão "Entrar"
                      SizedBox(
                        width: 140,
                        height: 38,
                        child: ElevatedButton(
                          onPressed:
                              () => Navigator.pushNamed(context, '/login'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD2A04D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Botão "Registrar"
                      SizedBox(
                        width: 140,
                        height: 38,
                        child: ElevatedButton(
                          onPressed:
                              () => Navigator.pushNamed(context, '/register'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD2A04D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Registrar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Rodapé com espaço embaixo
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: const Text(
                  '© Assembleia de Deus Ministério Espírito Santo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                    letterSpacing: -1,
                    height: 1.5,
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
