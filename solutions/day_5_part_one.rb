class SantaString
  attr_writer :splitted_string

  def initialize
    @vovels = ['a', 'e', 'i', 'o', 'u']
    @restricted_strings = ['ab', 'cd', 'pq', 'xy']
    @splitted_string
  end

  def nice?
    contains_at_least_three_vovels? && any_letter_appears_twice_in_a_row? && does_not_contain_restricted_strings?
  end

  private

  def contains_at_least_three_vovels?
    vovel_counter = 0
    @splitted_string.each { |char| vovel_counter += 1 if @vovels.include?(char) }
    vovel_counter >= 3 ? true : false
  end

  def any_letter_appears_twice_in_a_row?
    (@splitted_string.length - 1).times do |i|
      return true if @splitted_string[i] == @splitted_string[i + 1]
    end
    false
  end

  def does_not_contain_restricted_strings?
    (@splitted_string.length - 1).times do |i|
      return false if @restricted_strings.include?(@splitted_string[i..i + 1].join)
    end
    true
  end
end

santa_string = SantaString.new
strings = File.open('../puzzle_input/day_5.txt', 'r', &:read).split("\n").map { |string| string.chars }
nice_string_counter = 0
strings.each do |string|
  santa_string.splitted_string = string
  nice_string_counter += 1 if santa_string.nice?
end
puts nice_string_counter
