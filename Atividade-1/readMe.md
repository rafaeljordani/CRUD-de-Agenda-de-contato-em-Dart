# Lista de Contatos - CRUD em Dart

## Como rodar

```bash
dart run main.dart
```

## O que foi feito

### Nível 1 — CRUD funcional

- Adicionar contatos
- Listar contatos cadastrados
- Editar contatos existentes
- Remover contatos
- Validação de índice para impedir acesso a posições inexistentes

### Nível 2 — Robustez e consulta

- Validação de nome utilizando expressão regular
- Validação de telefone (10 ou 11 dígitos)
- Validação de e-mail utilizando expressão regular
- Busca de contatos pelo nome (ignorando letras maiúsculas e minúsculas)
- Verificação de nomes duplicados antes do cadastro
- Confirmação antes de remover um contato
- Mensagens de erro para entradas inválidas
- Conversão de nomes e e-mails para letras minúsculas nas comparações, tornando a busca e a verificação de duplicidade mais eficientes
- Organização do código em funções reutilizáveis, reduzindo repetição

### Nível 3 — App completo

(estatísticas, histórico, persistência em arquivo)

## Bônus implementados

- Validação de todos os dados inseridos pelo usuário
- Busca parcial por nome utilizando `contains()`
- Confirmação de exclusão do contato
- Verificação de lista vazia antes das operações de listar, editar, remover e buscar
- Funções separadas para cada responsabilidade, facilitando a manutenção do código

## Dificuldades e decisões

A maior dificuldade foi desenvolver uma função de validação de nome que fosse totalmente reutilizável em diferentes partes do CRUD. O desafio era garantir que a mesma função pudesse validar a entrada do usuário, impedir nomes inválidos, evitar contatos duplicados e ainda ser utilizada tanto no cadastro quanto na edição e na busca por nome, reduzindo a duplicação de código e tornando o projeto mais organizado e fácil de manter.
