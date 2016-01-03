class LightsGrid
  def initialize
    @grid = Array.new(1000) { Array.new(1000) { 0 } }
  end

  def turn_on(start_row, start_col, end_row, end_col)
    start_row.upto(end_row) do |row|
      start_col.upto(end_col) { |col| @grid[row][col] = 1 if 0 == @grid[row][col] }
    end
  end

  def turn_off(start_row, start_col, end_row, end_col)
    start_row.upto(end_row) do |row|
      start_col.upto(end_col) { |col| @grid[row][col] = 0 if 1 == @grid[row][col] }
    end
  end

  def toggle(start_row, start_col, end_row, end_col)
    start_row.upto(end_row) do |row|
      start_col.upto(end_col) { |col| 0 == @grid[row][col] ? @grid[row][col] = 1 : @grid[row][col] = 0 }
    end
  end

  def amount_of_lit_ligths
    counter = 0
    @grid.each do |row|
      row.each { |light_status| counter += 1 if 1 == light_status }
    end
    counter
  end
end

ligths_grid = LightsGrid.new
instructions = File.open('../puzzle_input/day_6.txt', 'r', &:read).split("\n").map { |string| string.split(' ') }
instructions.length.times { |i| instructions[i].shift if 'turn' == instructions[i].first }
instructions.each do |instruction|
  start_row = instruction[1].split(',').first.to_i
  start_col = instruction[1].split(',').last.to_i
  end_row = instruction[3].split(',').first.to_i
  end_col = instruction[3].split(',').last.to_i
  if 'on' == instruction.first
    ligths_grid.turn_on(start_row, start_col, end_row, end_col)
  elsif 'off' == instruction.first
    ligths_grid.turn_off(start_row, start_col, end_row, end_col)
  elsif 'toggle' == instruction.first
    ligths_grid.toggle(start_row, start_col, end_row, end_col)
  end
end
puts ligths_grid.amount_of_lit_ligths
