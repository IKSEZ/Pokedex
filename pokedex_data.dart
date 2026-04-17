import 'pokemon.dart';

final Pokemon chikorita = Pokemon(
  numero: 152,
  nome: 'Chikorita',
  tipo: 'Planta',
  nivel: 15,
  hpAtual: 69,
  hpMaximo: 70,
  capturado: true,
  proximaEvolucao: 'Bayleef',
  nivelEvolucao: 16,
);

final Pokemon lucario = Pokemon(
  numero: 448,
  nome: 'Lucario',
  tipo: 'Lutador/Aço',
  nivel: 30,
  hpAtual: 130,
  hpMaximo: 170,
  capturado: true,
  proximaEvolucao: null,
  nivelEvolucao: 0,
);

final Pokemon gardevoir = Pokemon(
  numero: 282,
  nome: 'Gardevoir',
  tipo: 'Psíquico/Fada',
  nivel: 25,
  hpAtual: 120,
  hpMaximo: 150,
  capturado: true,
  proximaEvolucao: null,
  nivelEvolucao: 0,
);

final PokemonFogo arcanine = PokemonFogo(
  numero: 59,
  nome: 'Arcanine',
  nivel: 50,
  hpAtual: 90,
  hpMaximo: 90,
  capturado: true,
);

final PokemonFogo cyndaquil = PokemonFogo(
  numero: 155,
  nome: 'Cyndaquil',
  nivel: 10,
  hpAtual: 39,
  hpMaximo: 39,
  capturado: true,
  proximaEvolucao: 'Quilava',
  nivelEvolucao: 14,
);

final PokemonAgua totodile = PokemonAgua(
  numero: 158,
  nome: 'Totodile',
  nivel: 12,
  hpAtual: 50,
  hpMaximo: 50,
  capturado: false,
  proximaEvolucao: 'Croconaw',
  nivelEvolucao: 18,
);

final PokemonAgua lapras = PokemonAgua(
  numero: 131,
  nome: 'Lapras',
  nivel: 35,
  hpAtual: 130,
  hpMaximo: 130,
  capturado: true,
);

final PokemonEletrico pikachu = PokemonEletrico(
  numero: 25,
  nome: 'Pikachu',
  nivel: 20,
  hpAtual: 35,
  hpMaximo: 35,
  capturado: true,
  proximaEvolucao: 'Raichu',
  nivelEvolucao: 30,
);

final PokemonEletrico mareep = PokemonEletrico(
  numero: 179,
  nome: 'Mareep',
  nivel: 15,
  hpAtual: 55,
  hpMaximo: 55,
  capturado: false,
  proximaEvolucao: 'Flaaffy',
  nivelEvolucao: 15,
);

final List<Pokemon> pokedex = [
  chikorita,
  lucario,
  gardevoir,
  arcanine,
  cyndaquil,
  totodile,
  lapras,
  pikachu,
  mareep,
];