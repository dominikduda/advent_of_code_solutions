class Present
  attr_writer :dimensions

  def initialize(dimensions = [])
    @dimensions = dimensions
  end

  def length_or_ribbon_needed_to_wrap
    length = 0
    index_of_max_dimension = @dimensions.index(@dimensions.max)
    @dimensions.length.times { |i| i == index_of_max_dimension ? next : length += 2 * @dimensions[i] }
    length + @dimensions.inject(&:*)
  end
end

total_length = 0
present = Present.new
dimensions_list = File.open('../puzzle_input/day_2.txt', 'r', &:read).split("\n")
dimensions_list.map! { |dimensions| dimensions.split('x').map(&:to_i) }
dimensions_list.each do |dimensions|
  present.dimensions = dimensions
  total_length += present.length_or_ribbon_needed_to_wrap
end
puts total_length

