import 'dart:io';

import 'contatos.dart';

class ContatoPessoal extends Contato {
  String apelido;
  ContatoPessoal(super.nome, super.telefone, super.email, this.apelido);

  @override
  void editarEspecial() {
    stdout.write('\nDeseja editar o apelido? (s/n): ');
    final resposta = (stdin.readLineSync() ?? '').toLowerCase();
    if (resposta == 's') {
      stdout.write('\nDigite o novo apelido: ');
      apelido = (stdin.readLineSync() ?? '').trim();
      print('\nApelido atualizado com sucesso!');
    }
  }

  @override
  void imprimirDetalhe() {
    super.imprimirDetalhe();
    print('Apelido: $apelido');
  }
}
