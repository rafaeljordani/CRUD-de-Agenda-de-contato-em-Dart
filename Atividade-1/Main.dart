import 'dart:io';
import 'contatos.dart';
import 'agenda.dart';

List<Contato> contatos = [];

main() {
  Agenda agenda = Agenda();

  while (true) {
    stdout.write(
      '\n1 - Adicionar contato \n 2 - Listar contato \n 3 - Editar contato \n 4 - Remover contato \n 5 - Procurar contato pelo nome  \n 6 - Sair \n Escolha uma opção: ',
    );

    String? menu = stdin.readLineSync() ?? 'seleção inválida, tente novamente';

    switch (menu) {
      case '1':
        {
          agenda.adicionarContato();
        }
      case '2':
        {
          agenda.listarContato();
        }
      case '3':
        {
          agenda.editarContato();
        }
      case '4':
        {
          agenda.removerContato();
        }
      case '5':
        {
          agenda.buscarPorNome();
        }
      case '6':
        {
          return;
        }
    }
  }
}
