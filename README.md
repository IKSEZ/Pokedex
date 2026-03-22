# Pokédex

Um aplicativo Dart interativo para gerenciar dados de Pokémon com encapsulamento, validações e métodos de ação.

## Sobre o Projeto

Este projeto implementa uma Pokédex funcional em Dart, demonstrando boas práticas de programação orientada a objetos, incluindo:

- **Encapsulamento** de dados com atributos privados
- **Getters e Setters** com validação de entrada
- **Métodos de ação** para modificar estado do Pokémon
- **Interface interativa** em linha de comando
- **Estrutura modular** com separação de responsabilidades

## Funcionalidades

✅ Listar Pokémon ordenados por número  
✅ Selecionar um Pokémon para gerenciar  
✅ Receber dano (reduz HP)  
✅ Curar HP (aumenta HP)  
✅ Subir nível (aumenta nível e HP máximo)  
✅ Visualizar stats em tempo real  
✅ Menu interativo com loop contínuo

## Como Usar

### Pré-requisitos

- Dart SDK 3.0+ instalado
- Windows, macOS ou Linux

### Instalação

```bash
git clone https://github.com/IKSEZ/Pokedex.git
cd Pokedex
dart run main.dart
```

### Navegação

1. Escolha um Pokémon da lista (1-3)
2. Selecione uma ação no menu:
   - **1**: Receber Dano
   - **2**: Curar HP
   - **3**: Subir Nível
   - **4**: Ver Stats
   - **5**: Sair

## Estrutura do Projeto

```
Pokedex/
├── main.dart          # Entrada principal com interface interativa
├── pokemon.dart       # Classe Pokémon com encapsulamento
├── pokedex_data.dart  # Dados dos Pokémon
├── pokedex_service.dart # Funções de busca e listagem
└── README.md          # Este arquivo
```

## Integrantes da Equipe

- **Gabriel Calderon**
- **Kevin Gritten**
- **Lázaro Sena**
- **Vinicius Chruczeski**

## Exemplo de Execução

```
=== Lista Ordenada por Número ===
1. Chikorita (#152)
2. Gardevoir (#282)
3. Lucario (#448)

Escolha um Pokemon pelo número da lista: 2

=== Stats Iniciais ===
Número: 282, Nome: Gardevoir, Tipo: Psíquico/Fada, Nível: 25, HP: 120/150, Capturado: Sim

=== Menu de Ações ===
1. Receber dano
2. Curar HP
3. Subir nível
4. Ver stats
5. Sair

Escolha uma ação (1-5): 1
Quanto de dano o Pokémon vai receber? 30
Dano recebido: 30
HP agora: 90/150
```

## Tecnologias Utilizadas

- **Linguagem**: Dart
- **Paradigma**: Orientado a Objetos
- **IDE**: Visual Studio Code

## Licença

Livre para uso educacional e pessoal.

---

**Última atualização**: Março 2026
