class Santa
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
    end
    add_house_to_list
  end

  def amount_of_visited_houses
    @visited_houses_cords.uniq.length
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
moves = File.open('../puzzle_input/day_3.txt', 'r', &:read).chars
moves.each { |direction| santa.move(direction) }
puts santa.amount_of_visited_houses
