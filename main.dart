import 'dart:io';

import 'pokedex_data.dart';
import 'pokedex_service.dart';
import 'pokemon.dart';

void main() {
  print('\n=== Lista Ordenada por Número ===');
  final List<Pokemon> pokedexOrdenada = List<Pokemon>.from(pokedex)
    ..sort((a, b) => a.numero.compareTo(b.numero));

  for (int i = 0; i < pokedexOrdenada.length; i++) {
    final Pokemon p = pokedexOrdenada[i];
    print('${i + 1}. ${p.nome} (#${p.numero})');
  }

  stdout.write('\nEscolha um Pokemon pelo número da lista: ');
  final String? entrada = stdin.readLineSync();
  final int? escolha = int.tryParse(entrada ?? '');

  if (escolha == null || escolha < 1 || escolha > pokedexOrdenada.length) {
    print('Escolha inválida. Digite um número entre 1 e ${pokedexOrdenada.length}.');
    return;
  }

  final Pokemon selecionado = pokedexOrdenada[escolha - 1];
  print('\n=== Stats Iniciais ===');
  print(selecionado);

  bool continuar = true;
  while (continuar) {
    print('\n=== Menu de Ações ===');
    print('1. Receber dano');
    print('2. Curar HP');
    print('3. Subir nível');
    print('4. Ver stats');
    print('5. Sair');

    stdout.write('\nEscolha uma ação (1-5): ');
    final String? acaoEntrada = stdin.readLineSync();
    final int? acao = int.tryParse(acaoEntrada ?? '');

    switch (acao) {
      case 1:
        stdout.write('Quanto de dano o Pokémon vai receber? ');
        final String? danoStr = stdin.readLineSync();
        final int? dano = int.tryParse(danoStr ?? '');
        if (dano != null && dano > 0) {
          selecionado.receberDano(dano);
          print('Dano recebido: $dano');
          print('HP agora: ${selecionado.hpAtual}/${selecionado.hpMaximo}');
          if (selecionado.hpAtual == 0) {
            print('O Pokémon ${selecionado.nome} foi derrotado!');
            continuar = false;
          }
        } else {
          print('Valor inválido.');
        }
        break;

      case 2:
        stdout.write('Quanto de HP o Pokémon vai recuperar? ');
        final String? curaStr = stdin.readLineSync();
        final int? cura = int.tryParse(curaStr ?? '');
        if (cura != null && cura > 0) {
          selecionado.curar(cura);
          print('Cura recebida: $cura');
          print('HP agora: ${selecionado.hpAtual}/${selecionado.hpMaximo}');
          if (selecionado.hpAtual == selecionado.hpMaximo) {
            print('O Pokémon ${selecionado.nome} está com HP cheio!');
          }
        } else {
          print('Valor inválido.');
        }
        break;

      case 3:
        stdout.write('Quantos níveis o Pokémon vai subir? ');
        final String? nivelStr = stdin.readLineSync();
        final int? niveis = int.tryParse(nivelStr ?? '');
        if (niveis != null && niveis > 0) {
          selecionado.subirNivel(niveis);
          print('Níveis subidos: $niveis');
          print('Nível agora: ${selecionado.nivel}');
          print('HP máximo agora: ${selecionado.hpMaximo}');
          print('HP atual agora: ${selecionado.hpAtual}/${selecionado.hpMaximo}');
          if (selecionado.nivel >= 100) {
            print('O Pokémon ${selecionado.nome} atingiu o nível máximo!');
          }
        } else {
          print('Valor inválido.');
        }
        break;

      case 4:
        print('\n=== Stats Atuais ===');
        print(selecionado);
        break;

      case 5:
        print('\nAté logo!');
        continuar = false;
        break;

      default:
        print('Ação inválida. Escolha um número entre 1 e 5.');
    }
  }
}
