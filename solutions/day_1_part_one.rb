class Santa
  attr_reader :floor

  def initialize(directions)
    @directions = directions.chars
    @floor = 0
  end

  def execute_next_direction
    '(' == @directions.shift ? @floor += 1 : @floor -= 1
  end

  def no_more_instructions?
    @directions.empty?
  end
end

directions = File.open('../puzzle_input/day_1.txt', 'r', &:read)
santa = Santa.new(directions)
santa.execute_next_direction until santa.no_more_instructions?
puts santa.floor
