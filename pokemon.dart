class Pokemon {
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
  }

  int get numero => _numero;
  set numero(int value) {
    if (value <= 0) {
      throw ArgumentError('Número deve ser maior que 0.');
    }
    _numero = value;
  }

  String get nome => _nome;
  set nome(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      throw ArgumentError('Nome não pode ser vazio.');
    }
    _nome = trimmed;
  }

  String get tipo => _tipo;
  set tipo(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      throw ArgumentError('Tipo não pode ser vazio.');
    }
    _tipo = trimmed;
  }

  int get nivel => _nivel;
  set nivel(int value) {
    if (value <= 0) {
      throw ArgumentError('Nível deve ser maior que 0.');
    }
    _nivel = value;
  }

  int get hpMaximo => _hpMaximo;
  set hpMaximo(int value) {
    if (value <= 0) {
      throw ArgumentError('HP máximo deve ser maior que 0.');
    }
    _hpMaximo = value;
    if (_hpAtualInicializado && _hpAtual > _hpMaximo) {
      _hpAtual = _hpMaximo;
    }
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
  set capturado(bool value) {
    _capturado = value;
  }

  String? get proximaEvolucao => _proximaEvolucao;
  set proximaEvolucao(String? value) {
    _proximaEvolucao = value?.trim();
    if (_proximaEvolucao != null && _proximaEvolucao!.isEmpty) {
      _proximaEvolucao = null;
    }
  }

  int get nivelEvolucao => _nivelEvolucao;
  set nivelEvolucao(int value) {
    if (value < 0) {
      throw ArgumentError('Nível de evolução não pode ser negativo.');
    }
    _nivelEvolucao = value;
  }

  void subirNivel(int quantidade) {
    if (quantidade < 1) {
      throw ArgumentError('Quantidade deve ser maior ou igual a 1.');
    }
    _nivel += quantidade;
    _hpMaximo += 10 * quantidade;
    _hpAtual = _hpMaximo;
  }

  void receberDano(int dano) {
    if (dano < 0) {
      throw ArgumentError('Dano deve ser um valor positivo.');
    }
    _hpAtual = (_hpAtual - dano).clamp(0, _hpMaximo);
  }

  void curar(int valorCura) {
    if (valorCura < 0) {
      throw ArgumentError('Valor de cura não pode ser negativo.');
    }
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

  @override
  String toString() {
    final String proxEvo = proximaEvolucao ?? 'Nenhuma';
    return 'Número: $numero, Nome: $nome, Tipo: $tipo, Nível: $nivel, HP: $hpAtual/$hpMaximo, Capturado: ${capturado ? "Sim" : "Não"}, Próxima evolução: $proxEvo, Nível de evolução: $nivelEvolucao';
  }
}