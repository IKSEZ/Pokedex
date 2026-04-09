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

void evoluiPokemmon(List<Pokemon> pokedex, String nome) {
  print('Pokemon evoluido para: $proximaEvolucao')
}