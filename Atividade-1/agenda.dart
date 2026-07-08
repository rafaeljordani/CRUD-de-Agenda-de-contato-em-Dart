import 'Main.dart';
import 'contatos.dart';
import 'dart:io';

class Agenda {
  List<Contato> _contatos = [];

  void adicionarContato() {
    String nome = validarNome();
    String telefone = validarTelefone();
    String email = validarEmail();

    Contato contato = Contato(nome, telefone, email);

    contatos.add(contato);

    print('Contao salvo');
  }

  void listarContato() {
    if (temContatoSalvo()) {
      listarListaDeContato();
    }
  }

  void editarContato() {
    if (temContatoSalvo()) {
      editarContatoDaLista();
    }
  }

  void removerContato() {
    if (temContatoSalvo()) {
      removerContatoDaLista();
    }
  }

  int validarIndece(String? removeEdit) {
    while (true) {
      stdout.write('Digite o indice do contato que deseja $removeEdit: ');
      String? indice = stdin.readLineSync();

      if ((indice == null) || (indice.isEmpty)) {
        print('Indice inválido, tente novamente');
        continue;
      }

      int i = int.tryParse(indice) ?? -1;

      i -= 1; // Ajusta o índice para corresponder à lista (0-based)

      if ((i >= contatos.length) || (i < 0)) {
        print('Indice inválido, tente novamente');
        continue;
      }
      return i;
    }
  }

  String validarNome({int? indiceIgnorar}) {
    String nomeValidar = '';
    bool validar = false;

    while (!validar) {
      stdout.write('nome: ');
      nomeValidar = stdin.readLineSync() ?? ' ';

      if (!RegExp(r'^[a-zA-ZÀ-ÿ][a-zA-ZÀ-ÿ\s]*$').hasMatch(nomeValidar)) {
        print('Nome inválido, tente novamente');
        continue;
      }
      if (verificarDuplicata(nomeValidar)) {
        print('O nome: $nomeValidar já existe na sua lista de contatos');
        continue;
      }
      validar = true;
    }
    return nomeValidar;
  }

  String validarTelefone() {
    String telefoneValidar = '';
    bool validar = false;

    while (!validar) {
      stdout.write('telefone: ');
      telefoneValidar = stdin.readLineSync() ?? ' ';
      if (!RegExp(r'^[0-9]{10,11}$').hasMatch(telefoneValidar)) {
        print('Telefone inválido, tente novamente');
        continue;
      }
      validar = true;
    }
    return telefoneValidar;
  }

  String validarEmail() {
    String emailValidar = '';
    bool validar = false;

    while (!validar) {
      stdout.write('email: ');
      emailValidar = stdin.readLineSync() ?? ' ';
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(emailValidar)) {
        print('Email inválido, tente novamente');
        continue;
      }
      validar = true;
    }
    return emailValidar.toLowerCase();
  }

  bool temContatoSalvo() {
    if (contatos.isEmpty) {
      print('Nenhum contato cadastrado');
      return false;
    }
    return true;
  }

  void listarListaDeContato() {
    int i;
    for (i = 0; i < contatos.length; i++) {
      print(
        '${i + 1} - Nome: ${contatos[i].nome} | Telefone: ${contatos[i].telefone} | Email: ${contatos[i].email}',
      );
    }
  }

  void removerContatoDaLista() {
    listarListaDeContato();
    int i = validarIndece('remover');
    if (confirmarRemocao()) {
      contatos.removeAt(i);
      print('Contato removido com sucesso!');
    } else {
      print('O usuário não foi removido');
    }
  }

  void editarContatoDaLista() {
    listarListaDeContato();
    int i = validarIndece('editar');
    String nomeEditado = validarNome();
    String telefoneEditado = validarTelefone();
    String emailEditado = validarEmail();

    contatos[i] = Contato(nomeEditado, telefoneEditado, emailEditado);

    print('Contato editado com sucesso!');
  }

  //PARTE 2

  void buscarPorNome() {
    if (temContatoSalvo()) {
      procurarPorNome();
    }
  }

  void procurarPorNome() {
    String nomeDigitado = validarNome().toLowerCase();
    bool achouNome = false;

    for (int i = 0; i < contatos.length; i++) {
      String nomeLista = contatos[i].nome.toLowerCase();

      if (nomeLista.contains(nomeDigitado)) {
        print(
          '${i + 1} - Nome: ${contatos[i].nome} | Telefone: ${contatos[i].telefone} | Email: ${contatos[i].email}',
        );
        achouNome = true;
      }

      if (achouNome == false) {
        print('Nenhum usuário foi encontrado com esse nome: $nomeDigitado');
      }
    }
  }

  bool verificarDuplicata(String nome, {int? indiceIgnorar}) {
    String nomeMinusculo = nome.toLowerCase();
    bool temRepetido = false;

    for (int i = 0; i < contatos.length; i++) {
      if (i == indiceIgnorar) continue;
      if (nomeMinusculo == contatos[i].nome.toLowerCase()) {
        temRepetido = true;
      }
    }
    if (temRepetido == true) {
      return true;
    }
    return false;
  }

  bool confirmarRemocao() {
    stdout.write('Tem certeza de que deseja remover este usuário? (s/n)');
    String ValidarSN = stdin.readLineSync() ?? 'n';
    String ValidarSNMinusculo = ValidarSN.toLowerCase();

    if (ValidarSNMinusculo == 's') {
      return true;
    }
    return false;
  }

  // Lembrar de no final colocar tudo em ToLowerCase
}
