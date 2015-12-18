class Present
  attr_writer :dimensions

  def initialize(dimensions = [])
    @dimensions = dimensions
  end

  def area_of_paper_needed_to_wrap
    area_1 = @dimensions[0] * @dimensions[1]
    area_2 = @dimensions[2] * @dimensions[0]
    area_3 = @dimensions[2] * @dimensions[1]
    2 * area_1 + 2 * area_2 + 2 * area_3 + smallest_side_area(area_1, area_2, area_3)
  end

  def length_or_ribbon_needed_to_wrap
    length = 0
    index_of_max = @dimensions.index(@dimensions.max)
    @dimensions.length.times { |i| i == index_of_max ? next : length += 2 * @dimensions[i] }
    length + @dimensions.inject(&:*)
  end

  private

  def smallest_side_area(area_1, area_2, area_3)
    [area_1, area_2, area_3].min
  end
end

total_area = 0
total_length = 0
present = Present.new
dimensions_list = File.open('../puzzle_input/day_2.txt', 'r', &:read).split("\n")
dimensions_list.map! { |dimensions| dimensions.split('x').map(&:to_i) }
dimensions_list.each do |dimensions|
  present.dimensions = dimensions
  total_area += present.area_of_paper_needed_to_wrap
  total_length += present.length_or_ribbon_needed_to_wrap
end
puts "Part one: #{total_area}"
puts "Part two: #{total_length}"

