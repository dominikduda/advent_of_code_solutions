class Santa
  attr_reader :visited_houses_cords

  def initialize
    @visited_houses_cords = [[0, 0]]
    @santa_x = 0
    @santa_y = 0
  end

  def move(direction)
    if '<' == direction
      move_west
    elsif '>' == direction
      move_east
    elsif '^' == direction
      move_north
    elsif 'v' == direction
      move_south
    else
      return nil
    end
    add_house_to_list
  end

  private

  def move_west
    @santa_x -= 1
  end

  def move_east
    @santa_x += 1
  end

  def move_north
    @santa_y -= 1
  end

  def move_south
    @santa_y += 1
  end

  def add_house_to_list
    @visited_houses_cords << [@santa_x, @santa_y]
  end
end

santa = Santa.new
robo_santa = Santa.new
moves = File.open('../puzzle_input/day_3.txt', 'r', &:read).chars
i = 1
moves.each do |direction|
  i.odd? ? santa.move(direction) : robo_santa.move(direction)
  i += 1
end
puts (santa.visited_houses_cords + robo_santa.visited_houses_cords).uniq.length
