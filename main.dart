import 'dart:io';

import 'pokedex_data.dart';
import 'pokedex_service.dart';
import 'pokemon.dart';

void cabecalho(String titulo) => print('\n=== $titulo ===');

void main() {
  // ── Q1 ──────────────────────────────────────────────────────
  cabecalho('Q1 — Fichas iniciais');
  chikorita.exibirFicha();
  lucario.exibirFicha();
  gardevoir.exibirFicha();

  // ── Q2 ──────────────────────────────────────────────────────
  cabecalho('Q2 — Encapsulamento e validações');

  lucario.subirNivel(2);
  print('${lucario.nome} subiu nível: ${lucario.nivel}');
  lucario.receberDano(40);
  print('${lucario.nome} recebeu dano. HP: ${lucario.hpAtual}');
  lucario.curar(20);
  print('${lucario.nome} curou. HP: ${lucario.hpAtual}');

  gardevoir.receberDano(200);
  print('${gardevoir.nome} HP após dano excessivo: ${gardevoir.hpAtual}');
  gardevoir.curar(999);
  print('${gardevoir.nome} HP após cura excessiva: ${gardevoir.hpAtual}');

  // ── Q3 ──────────────────────────────────────────────────────
  cabecalho('Q3 — Evolução');

  print('\nExemplo: Pokemon que ainda não pode evoluir');
  try {
    chikorita.evoluir();
  } on StateError catch (e) {
    print('Falha ao evoluir: ${e.message}');
  }

  print('\nExemplo: Pokemon que evolui');
  chikorita.subirNivel(1);
  print('Antes: $chikorita');
  chikorita.evoluir();
  print('Depois: $chikorita');

  // ── Q4 ──────────────────────────────────────────────────────
  cabecalho('Q4 — Pokédex (classe)');

  final Pokedex dex = Pokedex();
  for (final p in pokedex) {
    dex.adicionarPokemon(p);
  }
  dex.adicionarPokemon(pikachu); // duplicata bloqueada se já está na lista

  print('\nBusca #25: ${dex.buscarPorNumero(25)?.nome}');
  print('Busca #999: ${dex.buscarPorNumero(999)}');
  dex.removerPokemonPorNumero(131);
  dex.removerPokemonPorNumero(999);
  dex.adicionarPokemon(lapras);

  cabecalho('Todos os pokémons');
  dex.listarTodos();

  // ── Q5 ──────────────────────────────────────────────────────
  cabecalho('Q5 — Filtros');

  print('\nCapturados:');
  dex.listarCapturados().forEach((p) => print('  ${p.nome}'));

  print('\nTipo Elétrico:');
  dex.listarPorTipo('Elétrico').forEach((p) => print('  ${p.nome}'));

  print('\nAcima do nível 20:');
  dex.listarAcimaDoNivel(20).forEach((p) => print('  ${p.nome} (nível ${p.nivel})'));

  print('\nPodem evoluir:');
  dex.listarQuePodemEvoluir().forEach((p) => print('  ${p.nome}'));

  // ── Q6 ──────────────────────────────────────────────────────
  cabecalho('Q6 — Subclasses por tipo');
  arcanine.exibirFicha();
  lapras.exibirFicha();
  pikachu.exibirFicha();

  // ── Q7/Q8 ───────────────────────────────────────────────────
  cabecalho('Q8 — Batalha por polimorfismo');

  pikachu.curar(999);
  arcanine.curar(999);
  lapras.curar(999);

  executarTurno(pikachu, arcanine, ChoqueDoTrovao());
  executarTurno(lapras, pikachu, JatoDAgua());
  executarTurno(arcanine, lapras, LancaChamas());

  // ── Q9 ──────────────────────────────────────────────────────
  cabecalho('Q9 — Interface RegistravelNaPokedex');

  totodile.favoritar(); // bloqueado: não capturado
  totodile.marcarComoVisto();
  print('Visto: ${totodile.visto}');
  totodile.marcarComoCapturado();
  print('Capturado: ${totodile.capturado} | Visto: ${totodile.visto}');
  totodile.favoritar();
  print('Favorito: ${totodile.favorito}');
  totodile.desfavoritar();
  print('Favorito após desfavoritar: ${totodile.favorito}');

  // ── Q10 ─────────────────────────────────────────────────────
  cabecalho('Q10 — Funções anônimas');

  lucario.receberDano(150);
  pikachu.receberDano(30);

  print('\nHP abaixo de 30:');
  dex.todos
      .where((p) => p.hpAtual < 30)
      .forEach((p) => print('  ${p.nome} (HP ${p.hpAtual})'));

  print('\nOrdenados por nome (A-Z):');
  ([...dex.todos]..sort((a, b) => a.nome.compareTo(b.nome)))
      .forEach((p) => print('  ${p.nome}'));

  print('\nOrdenados por nível (decrescente):');
  ([...dex.todos]..sort((a, b) => b.nivel.compareTo(a.nivel)))
      .forEach((p) => print('  ${p.nome} (nível ${p.nivel})'));

  lucario.favoritar();
  lapras.favoritar();
  print('\nFavoritos:');
  dex.todos
      .where((p) => p.favorito)
      .forEach((p) => print('  ${p.nome}'));

  // ── Q11 ─────────────────────────────────────────────────────
  cabecalho('Q11 — Estatísticas');

  print('Total: ${dex.totalPokemons()}');
  print('Por tipo: ${dex.quantidadePorTipo()}');
  print('Média de nível: ${dex.mediaDeNivel().toStringAsFixed(2)}');
  print('% capturados: ${dex.percentualCapturados().toStringAsFixed(1)}%');

  // ── Q12 ─────────────────────────────────────────────────────
  cabecalho('Q12 — Simulação completa');

  cyndaquil.subirNivel(4); // nível 14, pode evoluir
  cyndaquil.evoluir();

  mareep.marcarComoCapturado();
  mareep.favoritar();
  chikorita.favoritar();

  print('\nFiltros finais:');
  print('Capturados: ${dex.listarCapturados().map((p) => p.nome).join(', ')}');
  print('Tipo Água: ${dex.listarPorTipo('Água').map((p) => p.nome).join(', ')}');
  print('Podem evoluir: ${dex.listarQuePodemEvoluir().map((p) => p.nome).join(', ')}');

  print('\nBatalha final:');
  cyndaquil.curar(999);
  totodile.curar(999);
  executarTurno(cyndaquil, totodile, LancaChamas());
  executarTurno(totodile, cyndaquil, JatoDAgua());

  cabecalho('Estatísticas finais');
  print('Total: ${dex.totalPokemons()}');
  print('Por tipo: ${dex.quantidadePorTipo()}');
  print('Média de nível: ${dex.mediaDeNivel().toStringAsFixed(2)}');
  print('% capturados: ${dex.percentualCapturados().toStringAsFixed(1)}%');

  // ── Menu interativo original ─────────────────────────────────
  cabecalho('Menu Interativo');

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
        final int? dano = int.tryParse(stdin.readLineSync() ?? '');
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

      case 2:
        stdout.write('Quanto de HP o Pokémon vai recuperar? ');
        final int? cura = int.tryParse(stdin.readLineSync() ?? '');
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

      case 3:
        stdout.write('Quantos níveis o Pokémon vai subir? ');
        final int? niveis = int.tryParse(stdin.readLineSync() ?? '');
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

      case 4:
        print('\n=== Stats Atuais ===');
        print(selecionado);

      case 5:
        print('\nAté logo!');
        continuar = false;

      default:
        print('Ação inválida. Escolha um número entre 1 e 5.');
    }
  }
}