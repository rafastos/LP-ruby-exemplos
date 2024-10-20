require 'ruby2d'
require_relative 'constants'
class Food
  attr_accessor :position

  def initialize(snake_body)
    @position = generate_random_pos(snake_body)
  end

  def draw
    Square.new(
      x: OFFSET + position[:x] * CELL_SIZE,
      y: OFFSET + position[:y] * CELL_SIZE,
      size: CELL_SIZE, color: 'red'
    )
  end

  def generate_random_cell
    {
      x: rand(CELL_COUNT),
      y: rand(CELL_COUNT)
    }
  end

  def generate_random_pos(snake_body)
    position = generate_random_cell
    position = generate_random_cell while snake_body.include?(position)
    position
  end
end
