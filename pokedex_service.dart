import 'pokemon.dart';

// Funções originais
void listarPokemon(List<Pokemon> pokedex) {
  print('=== Pokedex ===');
  print('Total: ${pokedex.length} pokemons\n');
  for (Pokemon p in pokedex) {
    print(p);
  }
  print('===============');
}

Pokemon? buscarPokemon(List<Pokemon> pokedex, String nome) {
  for (Pokemon p in pokedex) {
    if (p.nome.toLowerCase() == nome.toLowerCase()) {
      return p;
    }
  }
  return null;
}

void evoluiPokemon(List<Pokemon> pokedex, String nome) {
  final Pokemon? pokemon = buscarPokemon(pokedex, nome);
  if (pokemon == null) {
    print('Pokemon não encontrado: $nome');
    return;
  }
  try {
    pokemon.evoluir();
    print('Pokemon evoluiu para: ${pokemon.nome}');
  } on StateError catch (e) {
    print(e.message);
  }
}

// Questões 4, 5, 11
class Pokedex {
  final List<Pokemon> _pokemons = [];

  void adicionarPokemon(Pokemon p) {
    if (_pokemons.any((e) => e.numero == p.numero)) {
      print('Pokémon #${p.numero} (${p.nome}) já está na Pokédex.');
      return;
    }
    _pokemons.add(p);
  }

  bool removerPokemonPorNumero(int numero) {
    final antes = _pokemons.length;
    _pokemons.removeWhere((e) => e.numero == numero);
    final removido = _pokemons.length < antes;
    print(removido
        ? 'Pokémon #$numero removido com sucesso.'
        : 'Pokémon #$numero não encontrado na Pokédex.');
    return removido;
  }

  Pokemon? buscarPorNumero(int numero) {
    try {
      return _pokemons.firstWhere((e) => e.numero == numero);
    } catch (_) {
      return null;
    }
  }

  void listarTodos() {
    if (_pokemons.isEmpty) {
      print('Pokédex vazia.');
      return;
    }
    for (final p in _pokemons) {
      print(p);
    }
  }

  // Questão 5
  List<Pokemon> listarCapturados() =>
      _pokemons.where((p) => p.capturado).toList();

  List<Pokemon> listarPorTipo(String tipo) =>
      _pokemons.where((p) => p.tipo.toLowerCase() == tipo.toLowerCase()).toList();

  List<Pokemon> listarAcimaDoNivel(int nivelMinimo) =>
      _pokemons.where((p) => p.nivel > nivelMinimo).toList();

  List<Pokemon> listarQuePodemEvoluir() => _pokemons
      .where((p) => p.proximaEvolucao != null && p.nivel >= p.nivelEvolucao)
      .toList();

  // Questão 11
  int totalPokemons() => _pokemons.length;

  Map<String, int> quantidadePorTipo() {
    final mapa = <String, int>{};
    for (final p in _pokemons) {
      mapa[p.tipo] = (mapa[p.tipo] ?? 0) + 1;
    }
    return mapa;
  }

  double mediaDeNivel() {
    if (_pokemons.isEmpty) return 0;
    return _pokemons.map((p) => p.nivel).reduce((a, b) => a + b) /
        _pokemons.length;
  }

  double percentualCapturados() {
    if (_pokemons.isEmpty) return 0;
    return (_pokemons.where((p) => p.capturado).length / _pokemons.length) *
        100;
  }

  List<Pokemon> get todos => List.unmodifiable(_pokemons);
}

// Questão 8
void executarTurno(Pokemon atacante, Pokemon defensor, Habilidade habilidade) {
  habilidade.usar(atacante, defensor);
  print(
    '${atacante.nome} usou ${habilidade.nome}. '
    'HP de ${defensor.nome}: ${defensor.hpAtual}/${defensor.hpMaximo}',
  );
  if (defensor.hpAtual == 0) {
    print('${defensor.nome} foi derrotado!');
  }
}