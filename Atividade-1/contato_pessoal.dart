import 'contatos.dart';

class ContatoPessoal extends Contato {
  String apelido;
  ContatoPessoal(super.nome, super.telefone, super.email, this.apelido);
}
