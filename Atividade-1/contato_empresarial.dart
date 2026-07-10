import 'contatos.dart';

class ContatoEmpresarial extends Contato {
  String empresa;
  ContatoEmpresarial(super.nome, super.telefone, super.email, this.empresa);
}
