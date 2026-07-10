abstract class Contato {
  String nome;
  String telefone;
  String email;

  Contato(this.nome, this.telefone, this.email);

  void editarEspecial();

  void imprimirDetalhe() {
    print('=== DETALHE DO CONTATO');
    print('Nome: $nome');
    print('Telefone: $telefone');
    print('Email: $email');
  }
}
