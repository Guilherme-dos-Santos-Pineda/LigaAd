class Funcionario {
  String nome;
  String cargo;
  double salario;
  String modeloContratacao;

  void atividade() {
    String proprioNome = this.nome;
    print("$proprioNome está cumprindo seu turno");
  }

  Funcionario(this.nome, this.cargo, this.salario, this.modeloContratacao);
}

void main() {
  Funcionario vendendor1 = Funcionario("José", "Vendendor", 2000, "clt");
  Funcionario vendendor2 = Funcionario("Maria", "Vendendora", 2500, "pj");

  print(vendendor1.nome);
  print(vendendor2.nome);
  vendendor2.atividade();
}
