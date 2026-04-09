import 'pokemon.dart';

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