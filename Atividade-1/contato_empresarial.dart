import 'dart:io';

import 'contatos.dart';

class ContatoEmpresarial extends Contato {
  String empresa;
  ContatoEmpresarial(super.nome, super.telefone, super.email, this.empresa);

  @override
  void editarEspecial() {
    stdout.write('\nDeseja editar o empresa? (s/n): ');
    final resposta = (stdin.readLineSync() ?? '').toLowerCase();
    if (resposta == 's') {
      stdout.write('\nDigite o novo apelido: ');
      empresa = (stdin.readLineSync() ?? '').trim();
      print('\nApelido atualizado com sucesso!');
    }
  }

  @override
  void imprimirDetalhe() {
    super.imprimirDetalhe();
    print('Empresa: $empresa');
  }
}
