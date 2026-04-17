// Questão 9 — Interface
abstract class RegistravelNaPokedex {
  void marcarComoVisto();
  void marcarComoCapturado();
  void favoritar();
  void desfavoritar();
}

// Questões 1, 2, 3, 9
class Pokemon implements RegistravelNaPokedex {
  late int _numero;
  late String _nome;
  late String _tipo;
  late int _nivel;
  late int _hpAtual;
  late int _hpMaximo;
  late bool _capturado;
  bool _hpAtualInicializado = false;
  String? _proximaEvolucao;
  late int _nivelEvolucao;

  bool _visto = false;
  bool _favorito = false;
  int energia;

  Pokemon({
    required int numero,
    required String nome,
    required String tipo,
    required int nivel,
    required int hpAtual,
    required int hpMaximo,
    required bool capturado,
    required String? proximaEvolucao,
    required int nivelEvolucao,
    this.energia = 100,
  }) {
    this.numero = numero;
    this.nome = nome;
    this.tipo = tipo;
    this.nivel = nivel;
    this.hpMaximo = hpMaximo;
    this.hpAtual = hpAtual;
    this.capturado = capturado;
    this.proximaEvolucao = proximaEvolucao;
    this.nivelEvolucao = nivelEvolucao;
    if (capturado) _visto = true;
  }

  int get numero => _numero;
  set numero(int value) {
    if (value <= 0) throw ArgumentError('Número deve ser maior que 0.');
    _numero = value;
  }

  String get nome => _nome;
  set nome(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) throw ArgumentError('Nome não pode ser vazio.');
    _nome = trimmed;
  }

  String get tipo => _tipo;
  set tipo(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) throw ArgumentError('Tipo não pode ser vazio.');
    _tipo = trimmed;
  }

  int get nivel => _nivel;
  set nivel(int value) {
    if (value <= 0) throw ArgumentError('Nível deve ser maior que 0.');
    _nivel = value.clamp(1, 100);
  }

  int get hpMaximo => _hpMaximo;
  set hpMaximo(int value) {
    if (value <= 0) throw ArgumentError('HP máximo deve ser maior que 0.');
    _hpMaximo = value;
    if (_hpAtualInicializado && _hpAtual > _hpMaximo) _hpAtual = _hpMaximo;
  }

  int get hpAtual => _hpAtual;
  set hpAtual(int value) {
    if (value < 0 || value > _hpMaximo) {
      throw ArgumentError('HP atual deve estar entre 0 e o HP máximo.');
    }
    _hpAtual = value;
    _hpAtualInicializado = true;
  }

  bool get capturado => _capturado;
  set capturado(bool value) => _capturado = value;

  bool get visto => _visto;
  bool get favorito => _favorito;

  String? get proximaEvolucao => _proximaEvolucao;
  set proximaEvolucao(String? value) {
    _proximaEvolucao = value?.trim();
    if (_proximaEvolucao != null && _proximaEvolucao!.isEmpty) {
      _proximaEvolucao = null;
    }
  }

  int get nivelEvolucao => _nivelEvolucao;
  set nivelEvolucao(int value) {
    if (value < 0) throw ArgumentError('Nível de evolução não pode ser negativo.');
    _nivelEvolucao = value;
  }

  void subirNivel(int quantidade) {
    if (quantidade < 1) throw ArgumentError('Quantidade deve ser maior ou igual a 1.');
    _nivel = (_nivel + quantidade).clamp(1, 100);
    _hpMaximo += 10 * quantidade;
    _hpAtual = _hpMaximo;
  }

  void receberDano(int dano) {
    if (dano < 0) throw ArgumentError('Dano deve ser um valor positivo.');
    _hpAtual = (_hpAtual - dano).clamp(0, _hpMaximo);
  }

  void curar(int valorCura) {
    if (valorCura < 0) throw ArgumentError('Valor de cura não pode ser negativo.');
    _hpAtual = (_hpAtual + valorCura).clamp(0, _hpMaximo);
  }

  void evoluir() {
    if (_proximaEvolucao == null) {
      throw StateError('Este Pokemon não tem evolução disponível.');
    }
    if (_nivel < _nivelEvolucao) {
      throw StateError(
        'Este Pokemon só evolui no nível $_nivelEvolucao (nível atual: $_nivel).',
      );
    }
    _nome = _proximaEvolucao!;
    _proximaEvolucao = null;
    _hpMaximo += 20;
    _hpAtual = _hpMaximo;
  }

  int calcularAtaqueBase() => _nivel * 2;

  void exibirFicha() {
    print('--- #$_numero $_nome ---');
    print('Tipo: $_tipo | Nível: $_nivel');
    print('HP: $_hpAtual/$_hpMaximo | Energia: $energia');
    print('Capturado: ${_capturado ? "Sim" : "Não"} | Visto: $_visto | Favorito: $_favorito');
    if (_proximaEvolucao != null) print('Evolui para: $_proximaEvolucao (nível $_nivelEvolucao)');
  }

  @override
  void marcarComoVisto() => _visto = true;

  @override
  void marcarComoCapturado() {
    _capturado = true;
    _visto = true;
  }

  @override
  void favoritar() {
    if (!_capturado) {
      print('$_nome precisa ser capturado antes de ser favoritado.');
      return;
    }
    _favorito = true;
  }

  @override
  void desfavoritar() => _favorito = false;

  @override
  String toString() {
    final String proxEvo = proximaEvolucao ?? 'Nenhuma';
    return 'Número: $_numero, Nome: $_nome, Tipo: $_tipo, Nível: $_nivel, HP: $_hpAtual/$_hpMaximo, Capturado: ${_capturado ? "Sim" : "Não"}, Próxima evolução: $proxEvo, Nível de evolução: $_nivelEvolucao';
  }
}

// Questão 6
class PokemonFogo extends Pokemon {
  PokemonFogo({
    required super.numero,
    required super.nome,
    required super.nivel,
    required super.hpAtual,
    required super.hpMaximo,
    required super.capturado,
    super.proximaEvolucao,
    super.nivelEvolucao = 100,
    super.energia = 100,
  }) : super(tipo: 'Fogo');

  @override
  int calcularAtaqueBase() => nivel * 3;

  @override
  void exibirFicha() {
    super.exibirFicha();
    print('Categoria: Pokémon de Fogo | Ataque base: ${calcularAtaqueBase()}');
  }

  @override
  String toString() => '${super.toString()}, Categoria: Fogo, Ataque base: ${calcularAtaqueBase()}';
}

class PokemonAgua extends Pokemon {
  PokemonAgua({
    required super.numero,
    required super.nome,
    required super.nivel,
    required super.hpAtual,
    required super.hpMaximo,
    required super.capturado,
    super.proximaEvolucao,
    super.nivelEvolucao = 100,
    super.energia = 100,
  }) : super(tipo: 'Água');

  @override
  int calcularAtaqueBase() => nivel * 2 + 10;

  @override
  void exibirFicha() {
    super.exibirFicha();
    print('Categoria: Pokémon de Água | Ataque base: ${calcularAtaqueBase()}');
  }

  @override
  String toString() => '${super.toString()}, Categoria: Água, Ataque base: ${calcularAtaqueBase()}';
}

class PokemonEletrico extends Pokemon {
  PokemonEletrico({
    required super.numero,
    required super.nome,
    required super.nivel,
    required super.hpAtual,
    required super.hpMaximo,
    required super.capturado,
    super.proximaEvolucao,
    super.nivelEvolucao = 100,
    super.energia = 100,
  }) : super(tipo: 'Elétrico');

  @override
  int calcularAtaqueBase() => nivel * 2 + 15;

  @override
  void exibirFicha() {
    super.exibirFicha();
    print('Categoria: Pokémon Elétrico | Ataque base: ${calcularAtaqueBase()}');
  }

  @override
  String toString() => '${super.toString()}, Categoria: Elétrico, Ataque base: ${calcularAtaqueBase()}';
}

// Questão 7
abstract class Habilidade {
  final String nome;
  final int custoEnergia;

  Habilidade(this.nome, this.custoEnergia);

  void usar(Pokemon usuario, Pokemon alvo);
}

class ChoqueDoTrovao extends Habilidade {
  ChoqueDoTrovao() : super('Choque do Trovão', 20);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    if (usuario.energia < custoEnergia) {
      print('${usuario.nome} não tem energia suficiente para usar $nome.');
      return;
    }
    usuario.energia -= custoEnergia;
    alvo.receberDano(usuario.calcularAtaqueBase() + 5);
  }
}

class JatoDAgua extends Habilidade {
  JatoDAgua() : super("Jato d'Água", 15);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    if (usuario.energia < custoEnergia) {
      print('${usuario.nome} não tem energia suficiente para usar $nome.');
      return;
    }
    usuario.energia -= custoEnergia;
    alvo.receberDano(usuario.calcularAtaqueBase() + 3);
  }
}

class LancaChamas extends Habilidade {
  LancaChamas() : super('Lança-Chamas', 25);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    if (usuario.energia < custoEnergia) {
      print('${usuario.nome} não tem energia suficiente para usar $nome.');
      return;
    }
    usuario.energia -= custoEnergia;
    alvo.receberDano(usuario.calcularAtaqueBase() + 7);
  }
}