require 'ruby2d'
require_relative 'constants'

class Snake
  # Permite acesso externo aos atributos principais da cobra
  # body: Array de posições que forma o corpo da cobra
  # direction: Hash com a direção atual do movimento
  # add_segment: Boolean que indica se deve crescer
  # squares: Array que guarda as representações visuais de cada segmento
  attr_accessor :body, :direction, :add_segment, :squares

  def initialize
    # Inicializa o corpo da cobra com três segmentos
    # Cada posição é um hash com coordenadas x e y
    @body = [
      { x: 6, y: 9 },  # Cabeça
      { x: 5, y: 9 },  # Corpo
      { x: 4, y: 9 }   # Cauda
    ]

    # Define a direção inicial para a direita
    # x: 1 (direita), y: 0 (sem movimento vertical)
    @direction = { x: 1, y: 0 }

    # Flag que controla o crescimento da cobra
    # Quando true, a cobra cresce ao se mover
    @add_segment = false

    # Array que armazena os objetos Square (representação visual)
    # Cada segmento do corpo tem um Square correspondente
    @squares = []
  end

  def draw
    # Remove todos os quadrados anteriores da tela
    # Isso é necessário para atualizar a posição da cobra
    @squares.each(&:remove) # Remove cada Square da tela
    @squares.clear # Limpa o array de squares

    # Desenha um novo quadrado para cada segmento do corpo
    body.each do |segment|
      # Cria um novo quadrado para o segmento
      square = Square.new(
        # Calcula a posição X na tela
        # OFFSET (margem) + (posição na grade * tamanho da célula)
        x: OFFSET + segment[:x] * CELL_SIZE,
        # Calcula a posição Y na tela
        y: OFFSET + segment[:y] * CELL_SIZE,
        # Tamanho ligeiramente menor que a célula para criar efeito de grade
        size: CELL_SIZE - 1,
        # Cor verde escura para a cobra
        color: DARK_GREEN,
        # z-index 20 para garantir que apareça acima do fundo
        z: 20
      )
      # Adiciona o quadrado ao array de squares
      @squares << square
    end
  end

  def update
    # Calcula a nova posição da cabeça
    # Soma a direção atual à posição da cabeça
    new_head = {
      x: body.first[:x] + direction[:x],
      y: body.first[:y] + direction[:y]
    }

    # Adiciona a nova cabeça no início do corpo
    body.unshift(new_head)

    # Controla o crescimento da cobra
    if add_segment
      # Se add_segment é true, mantém o último segmento
      # (a cobra cresce)
      @add_segment = false
    else
      # Se add_segment é false, remove o último segmento
      # (a cobra mantém o tamanho)
      body.pop
    end
  end

  def reset
    # Reinicia a cobra para o estado inicial
    # Usado após game over

    # Volta ao tamanho e posição inicial
    @body = [
      { x: 6, y: 9 },
      { x: 5, y: 9 },
      { x: 4, y: 9 }
    ]

    # Reinicia a direção para a direita
    @direction = { x: 1, y: 0 }
  end
end
