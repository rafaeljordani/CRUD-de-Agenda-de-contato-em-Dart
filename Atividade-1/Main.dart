import 'dart:io';

List<String> nomesList = [];
List<String> telefonesList = [];
List<String> emailsList = [];

int indiceSolicitado = 0;
main() {
  nomesList.add('rafael');
  telefonesList.add('1234567890');
  emailsList.add('rafael@gmail.com');
  menu();
}

void menu() {
  while (true) {
    stdout.write(
      '\n1 - Adicionar contato \n 2 - Listar contato \n 3 - Editar contato \n 4 - Remover contato \n 5 - Procurar contato pelo nome  \n 6 - Sair \n Escolha uma opção: ',
    );

    String? menu = stdin.readLineSync() ?? 'seleção inválida, tente novamente';

    switch (menu) {
      case '1':
        {
          adicionarContato();
        }
      case '2':
        {
          listarContato();
        }
      case '3':
        {
          editarContato();
        }
      case '4':
        {
          removerContato();
        }
      case '5':
        {
          buscarPorNome();
        }
      case '6':
        {
          return;
        }
    }
  }
}

void adicionarContato() {
  nomesList.add(validarNome());
  telefonesList.add(validarTelefone());
  emailsList.add(validarEmail());
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

    if ((i >= nomesList.length) || (i < 0)) {
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
  if (nomesList.isEmpty) {
    print('Nenhum contato cadastrado');
    return false;
  }
  return true;
}

void listarListaDeContato() {
  int i;
  for (i = 0; i < nomesList.length; i++) {
    print(
      '${i + 1} - Nome: ${nomesList[i]} | Telefone: ${telefonesList[i]} | Email: ${emailsList[i]}',
    );
  }
}

void removerContatoDaLista() {
  listarListaDeContato();
  int i = validarIndece('remover');
  if (confirmarRemocao()) {
    nomesList.removeAt(i);
    telefonesList.removeAt(i);
    emailsList.removeAt(i);

    print('Contato removido com sucesso!');
  } else {
    print('O usuário não foi removido');
  }
}

void editarContatoDaLista() {
  listarListaDeContato();
  int i = validarIndece('editar');
  nomesList[i] = validarNome();
  telefonesList[i] = validarTelefone();
  emailsList[i] = validarEmail();
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

  for (int i = 0; i < nomesList.length; i++) {
    String nomeLista = nomesList[i].toLowerCase();

    if (nomeLista.contains(nomeDigitado)) {
      print(
        '${i + 1} - Nome: ${nomesList[i]} | Telefone: ${telefonesList[i]} | Email: ${emailsList[i]}',
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

  for (int i = 0; i < nomesList.length; i++) {
    if (i == indiceIgnorar) continue;
    if (nomeMinusculo == nomesList[i].toLowerCase()) {
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