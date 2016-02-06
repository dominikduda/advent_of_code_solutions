class SantaString
  attr_writer :splitted_string

  def initialize
    @splitted_string
  end

  def nice?
    any_non_overlapping_pair? && any_letter_repeat_with_one_letter_separator?
  end

  private

  def contains?(container, pair)
    (container.length - 1).times do |i|
      return true if container[i] == pair.first && container[i + 1] == pair.last
    end
    false
  end

  def any_non_overlapping_pair?
    pair = []
    splitted_string_length = @splitted_string.length
    (splitted_string_length - 1).times do |i|
      pair = @splitted_string[i..i + 1]
      return true if contains?(@splitted_string[i + 2..splitted_string_length], pair)
    end
    false
  end

  def any_letter_repeat_with_one_letter_separator?
    (@splitted_string.length - 2).times do |i|
      return true if @splitted_string[i] == @splitted_string[i + 2]
    end
    false
  end
end

santa_string = SantaString.new
strings = File.open('../puzzle_input/day_5.txt', 'r', &:read).split("\n").map(&:chars)
nice_string_counter = 0
strings.each do |string|
  santa_string.splitted_string = string
  nice_string_counter += 1 if santa_string.nice?
end
puts nice_string_counter
