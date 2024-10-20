require 'ruby2d'
require_relative 'constants'
class Food
  # Permite acesso externo à posição e ao quadrado que representa a comida
  attr_accessor :position, :square

  # Inicializa uma nova comida
  # @param snake_body - Array de posições do corpo da cobra para evitar que a comida apareça sobre ela
  def initialize(snake_body)
    # Gera uma posição aleatória inicial que não colida com o corpo da cobra
    @position = generate_random_pos(snake_body)
    # Variável que armazenará o objeto Square (representação visual da comida)
    # Inicializada como nil pois será criada apenas no método draw
    @square = nil
  end

  # Método responsável por desenhar a comida na tela
  def draw
    # Remove a representação visual anterior da comida, se existir
    # O operador &. (safe navigation) evita erro caso @square seja nil
    @square&.remove

    # Cria um novo quadrado vermelho para representar a comida
    @square = Square.new(
      # Calcula a posição X na tela:
      # OFFSET (margem) + (posição na grade * tamanho da célula)
      x: OFFSET + position[:x] * CELL_SIZE,
      # Calcula a posição Y na tela da mesma forma
      y: OFFSET + position[:y] * CELL_SIZE,
      # Tamanho ligeiramente menor que a célula para criar efeito de grade
      size: CELL_SIZE - 1,
      # Cor vermelha para diferenciar da cobra
      color: 'red',
      # z-index 20 para garantir que apareça acima do fundo
      z: 20
    )
  end

  # Gera uma posição aleatória dentro da grade do jogo
  # @return Hash com coordenadas x e y
  def generate_random_cell
    {
      # rand(CELL_COUNT) gera um número aleatório entre 0 e CELL_COUNT-1
      x: rand(CELL_COUNT),
      y: rand(CELL_COUNT)
    }
  end

  # Gera uma posição aleatória que não colida com o corpo da cobra
  # @param snake_body - Array de posições do corpo da cobra
  # @return Hash com coordenadas x e y válidas
  def generate_random_pos(snake_body)
    # Gera uma posição inicial
    position = generate_random_cell
    # Continua gerando novas posições enquanto a posição atual
    # estiver ocupada pelo corpo da cobra
    position = generate_random_cell while snake_body.include?(position)
    # Retorna uma posição válida (que não colide com a cobra)
    position
  end
end
