class Santa
  attr_reader :number_of_executed_instructions

  def initialize(directions)
    @directions = directions.chars
    @floor = 0
    @number_of_executed_instructions = 0
  end

  def execute_next_direction
    '(' == @directions.shift ? @floor += 1 : @floor -= 1
    @number_of_executed_instructions += 1
  end

  def in_basement?
    -1 == @floor
  end
end

directions = File.open('../puzzle_input/day_1.txt', 'r', &:read)
santa = Santa.new(directions)
# first_time_in_basement = 0
santa.execute_next_direction until santa.in_basement?
first_time_in_basement = santa.number_of_executed_instructions
puts first_time_in_basement
