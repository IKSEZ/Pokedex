import 'pokemon.dart';

final Pokemon chikorita = Pokemon(
  numero: 152,
  nome: 'Chikorita',
  tipo: 'Planta',
  nivel: 15,
  hpAtual: 69,
  hpMaximo: 70,
  capturado: true,
);

final Pokemon lucario = Pokemon(
  numero: 448,
  nome: 'Lucario',
  tipo: 'Lutador/Aço',
  nivel: 30,
  hpAtual: 130,
  hpMaximo: 170,
  capturado: true,
);

final Pokemon gardevoir = Pokemon(
  numero: 282,
  nome: 'Gardevoir',
  tipo: 'Psíquico/Fada',
  nivel: 25,
  hpAtual: 120,
  hpMaximo: 150,
  capturado: true,
);

final List<Pokemon> pokedex = [chikorita, lucario, gardevoir];

