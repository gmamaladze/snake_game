require 'set'

class Snake
  SYMBOL = 'O'
  attr_reader :length, :last_part, :current_direction

  def initialize
    @body = [[4,10], [4,9], [4,8]]
    @length = @body.length
    @current_direction = Direction::RIGHT
  end

  def set_direction(direction)
    @current_direction = direction
  end

  def tick
    move_by(@current_direction)
  end

  def move_by(direction)
    move_to(x + direction[0], y + direction[1])
  end

  def x
    @body[0][0]
  end

  def y
    @body[0][1]
  end

  def grow
    @length +=1
  end

  def move_to(x,y)
    @body.insert(0, [x, y])
    trim
  end

  def include?(elem)
    @body.include?(elem)
  end

  def [](idx)
    @body[idx]
  end

  def crashed?
    visited = Set.new

    @body.each_with_index do |position, i|
      if visited.include?(position)
        return true
      else
        visited << position
      end
    end

    return false
  end

  private

  def trim
    @last_part = @body.pop while @length < @body.length
  end

end
