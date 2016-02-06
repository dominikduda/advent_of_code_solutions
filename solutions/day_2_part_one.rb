class Present
  attr_writer :dimensions

  def initialize(dimensions)
    @side_1_area = dimensions[0] * dimensions[1]
    @side_2_area = dimensions[2] * dimensions[0]
    @side_3_area = dimensions[2] * dimensions[1]
  end

  def area_of_paper_needed_to_wrap
    present_area + smallest_side_area
  end

  private

  def present_area
    2 * @side_1_area + 2 * @side_2_area + 2 * @side_3_area
  end

  def smallest_side_area
    [@side_1_area, @side_2_area, @side_3_area].min
  end
end

total_area = 0
dimensions_list = File.open('../puzzle_input/day_2.txt', 'r', &:read).split("\n")
dimensions_list.map! { |dimensions| dimensions.split('x').map(&:to_i) }
dimensions_list.each { |dimensions| total_area += Present.new(dimensions).area_of_paper_needed_to_wrap }
puts total_area
