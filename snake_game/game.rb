require 'ruby2d'
require_relative 'constants'
require_relative 'food'
require_relative 'snake'

class Game
  # Permite acesso externo aos principais componentes e estados do jogo
  attr_accessor :snake, :food, :running, :score, :background_elements

  def initialize
    # Inicializa os componentes principais do jogo
    @snake = Snake.new
    @food = Food.new(snake.body)

    # Estado inicial do jogo
    @running = true # Controla se o jogo está em execução
    @score = 0 # Pontuação inicial

    # Controle de tempo para atualização do jogo
    @last_update = Time.now

    # Array para armazenar elementos visuais do fundo
    @background_elements = []

    # Carrega os arquivos de som
    # begin/rescue para não quebrar o jogo se os arquivos não existirem
    begin
      @eat_sound = Sound.new('sound/eat.mp3')     # Som quando come a comida
      @wall_sound = Sound.new('sound/wall.mp3')   # Som quando colide
    rescue StandardError
      puts 'Aviso: Arquivos de som não encontrados'
    end
  end

  def draw
    # Remove elementos de fundo anteriores para redesenhar
    @background_elements.each(&:remove)
    @background_elements.clear

    # Desenha o fundo verde claro
    @background_elements << Rectangle.new(
      x: 0,
      y: 0,
      width: Window.width,
      height: Window.height,
      color: GREEN,
      z: 0 # z-index mais baixo para ficar atrás de tudo
    )

    # Desenha a borda do campo de jogo
    @background_elements << Rectangle.new(
      x: OFFSET - 5,
      y: OFFSET - 5,
      width: GRID_SIZE + 10,
      height: GRID_SIZE + 10,
      color: DARK_GREEN,
      z: 10
    )

    # Desenha o campo de jogo (área interna)
    @background_elements << Rectangle.new(
      x: OFFSET,
      y: OFFSET,
      width: GRID_SIZE,
      height: GRID_SIZE,
      color: GREEN,
      z: 11
    )

    # Desenha o título "Snake"
    @background_elements << Text.new(
      'Snake',
      x: OFFSET - 5,
      y: 20,
      size: 40,
      color: DARK_GREEN,
      z: 12
    )

    # Desenha a pontuação atual
    @background_elements << Text.new(
      score.to_s,
      x: OFFSET - 5,
      y: OFFSET + GRID_SIZE + 10,
      size: 40,
      color: DARK_GREEN,
      z: 12
    )

    # Desenha os elementos do jogo
    food.draw   # Desenha a comida
    snake.draw  # Desenha a cobra
  end

  def update
    # Verifica se é hora de atualizar
    return unless can_update?
    # Verifica se o jogo está em execução
    return unless running

    # Atualiza a posição da cobra
    snake.update

    # Verifica todas as colisões possíveis
    check_collision_with_food
    check_collision_with_edges
    check_collision_with_tail
  end

  # Controla a velocidade do jogo
  def can_update?
    current_time = Time.now
    if current_time - @last_update >= 0.2 # Atualiza a cada 0.2 segundos
      @last_update = current_time
      true
    else
      false
    end
  end

  # Verifica se a cobra comeu a comida
  def check_collision_with_food
    return unless snake.body.first == food.position

    # Gera nova posição para a comida
    food.position = food.generate_random_pos(snake.body)
    # Sinaliza que a cobra deve crescer
    snake.add_segment = true
    # Aumenta a pontuação
    @score += 1
    # Toca o som de comer (se disponível)
    @eat_sound&.play
  end

  # Verifica se a cobra bateu nas bordas
  def check_collision_with_edges
    head = snake.body.first
    # Verifica se a cabeça está fora dos limites do campo
    return unless head[:x] >= CELL_COUNT || (head[:x]).negative? || head[:y] >= CELL_COUNT || (head[:y]).negative?

    game_over
  end

  # Verifica se a cobra bateu no próprio corpo
  def check_collision_with_tail
    head = snake.body.first
    # Verifica se a posição da cabeça existe no resto do corpo
    return unless snake.body[1..].include?(head)

    game_over
  end

  # Lida com o fim do jogo
  def game_over
    # Reinicia a cobra
    snake.reset
    # Reposiciona a comida
    food.position = food.generate_random_pos(snake.body)
    # Para o jogo
    @running = false
    # Zera a pontuação
    @score = 0
    # Toca o som de colisão (se disponível)
    @wall_sound&.play
  end
end
