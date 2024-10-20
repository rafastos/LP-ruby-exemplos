require 'ruby2d'
require_relative 'game'

game = Game.new

# Configuração inicial da janela do jogo
set title: 'Snake Game' # Título da janela
# Largura = 2 * margem + tamanho da grade
set width: 2 * OFFSET + GRID_SIZE
# Altura = 2 * margem + tamanho da grade
set height: 2 * OFFSET + GRID_SIZE
# Define o limite de FPS (frames por segundo)
set fps_cap: 60

# Criação da instância principal do jogo
game = Game.new

# Fluxo do jogo
# Inicialização
# └── Loop Principal
# ├── Entrada do Usuário (on :key_down)
# ├── Atualização (update)
# │   └── Lógica do Jogo
# └── Renderização (render)
#     └── Desenho na Tela

# Configuração dos controles do jogo
# Detecta quando uma tecla é pressionada
on :key_down do |event|
  # Verifica qual tecla foi pressionada e atualiza a direção da cobra
  case event.key
  when 'up'
    # Só permite ir para cima se não estiver indo para baixo
    if game.snake.direction[:y] != 1
      game.snake.direction = { x: 0, y: -1 }
      game.running = true
    end
  when 'down'
    # Só permite ir para baixo se não estiver indo para cima
    if game.snake.direction[:y] != -1
      game.snake.direction = { x: 0, y: 1 }
      game.running = true
    end
  when 'left'
    # Só permite ir para esquerda se não estiver indo para direita
    if game.snake.direction[:x] != 1
      game.snake.direction = { x: -1, y: 0 }
      game.running = true
    end
  when 'right'
    # Só permite ir para direita se não estiver indo para esquerda
    if game.snake.direction[:x] != -1
      game.snake.direction = { x: 1, y: 0 }
      game.running = true
    end
  end
end

# Loop de atualização do jogo
# Chamado automaticamente pela Ruby2D
update do
  # Atualiza a lógica do jogo
  game.update
end

# Loop de renderização do jogo
# Chamado automaticamente pela Ruby2D
render do
  # Desenha todos os elementos do jogo
  game.draw
end

# Inicia o jogo
# Este comando mantém a janela aberta e o jogo rodando
show
