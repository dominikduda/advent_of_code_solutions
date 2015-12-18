class Santa
  attr_reader :floor, :number_of_executed_instructions

  def initialize(directions)
    @directions = directions.chars
    @floor = 0
    @number_of_executed_instructions= 0
  end

  def execute_next_direction
    '(' == @directions.shift ? @floor += 1 : @floor -= 1
    @number_of_executed_instructions+= 1
  end

  def in_basement?
    -1 == @floor
  end

  def no_more_instructions?
    @directions.empty?
  end
end

directions = File.open('../puzzle_input/day_1.txt', 'r', &:read)
santa = Santa.new(directions)
first_time_in_basement = 0
until santa.no_more_instructions? do
  santa.execute_next_direction
  first_time_in_basement = santa.number_of_executed_instructions if 0 == first_time_in_basement && santa.in_basement?
end
puts "Part one: #{santa.floor}"
puts "Part two: #{first_time_in_basement}"
