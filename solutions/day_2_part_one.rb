class Present
  attr_writer :dimensions

  def initialize(dimensions = [])
    @dimensions = dimensions
  end

  def area_of_paper_needed_to_wrap
    area_1 = @dimensions[0] * @dimensions[1]
    area_2 = @dimensions[2] * @dimensions[0]
    area_3 = @dimensions[2] * @dimensions[1]
    2 * area_1 + 2 * area_2 + 2 * area_3 + smallest_area(area_1, area_2, area_3)
  end

  private

  def smallest_area(area_1, area_2, area_3)
    [area_1, area_2, area_3].min
  end
end

total_area = 0
present = Present.new
dimensions_list = File.open('../puzzle_input/day_2.txt', 'r', &:read).split("\n")
dimensions_list.map! { |dimensions| dimensions.split('x').map(&:to_i) }
dimensions_list.each do |dimensions|
  present.dimensions = dimensions
  total_area += present.area_of_paper_needed_to_wrap
end
puts total_area

