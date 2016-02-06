class String
  def integer?
    self.to_i.to_s == self
  end
end

class Wire
  attr_reader :input, :input_two

  def initialize(input, input_gate, input_two)
    input = input.to_i if input.is_a?(String) && input.integer?
    @input = input
    input_two = input_two.to_i if input_two.is_a?(String) && input_two.integer?
    @input_two = input_two
    @input_gate = input_gate
  end

  def signal
    return nil unless calculate_signal_possible?
    case @input_gate
    when 'NOT' then return bitwise_not
    when 'AND' then return bitwise_and
    when 'OR' then return bitwise_or
    when 'LSHIFT' then return bitwise_left_shift
    when 'RSHIFT' then return bitwise_right_shift
    when nil then return @input
    end
  end

  def update_input(wires_with_known_signal)
    @input = wires_with_known_signal[input] unless wires_with_known_signal[input].nil?
    @input_two = wires_with_known_signal[input_two] unless wires_with_known_signal[input_two].nil?
  end

  private

  def calculate_signal_possible?
    return true if @input.is_a?(Fixnum) && 'NOT' == @input_gate
    return true if @input.is_a?(Fixnum) && @input_two.is_a?(Fixnum)
    return true if @input_gate.nil?
    false
  end

  def bitwise_and
    @input & @input_two
  end

  def bitwise_or
    @input | @input_two
  end

  def bitwise_left_shift
    @input << @input_two
  end

  def bitwise_right_shift
    @input >> @input_two
  end

  def bitwise_not
    signal = @input.to_s(2).chars
    signal.map! { |binary_number| '1' == binary_number ? '0' : '1' }
    signal.join('').to_i(2)
  end
end

class Circuit
  def initialize
    @wires_with_unknown_signal = {}
    @wires_with_known_signal = {}
  end

  def plug_in_wire(instruction)
    @wires_with_unknown_signal[instruction.first] = Wire.new(instruction[1], instruction[2], instruction[3])
  end

  def run_circuit
    until @wires_with_unknown_signal.empty?
      connect_wires_possible_to_connect
      filter_wires_with_known_signal
    end
  end

  def signal_provided_to_wire(id)
    @wires_with_known_signal[id]
  end

  private

  def connect_wires_possible_to_connect
    @wires_with_unknown_signal.each do |wire_id, wire|
      wire.update_input(@wires_with_known_signal)
      wire_signal = wire.signal
      @wires_with_unknown_signal[wire_id] = wire_signal if wire_signal.is_a?(Fixnum)
    end
  end

  def filter_wires_with_known_signal
    @wires_with_unknown_signal.each do |wire_id, wire|
      next if wire.is_a?(String)
      if wire.is_a?(Fixnum)
        @wires_with_known_signal[wire_id] = wire
        @wires_with_unknown_signal.delete(wire_id)
      end
    end
  end
end

circuit = Circuit.new
instructions = File.open('../puzzle_input/day_7.txt', 'r', &:read).gsub('-> ', '').split("\n")
instructions.map! { |instruction| instruction.split(' ') }
instructions.map do |instruction|
  next unless 'NOT' == instruction.first
  temp = instruction[0]
  instruction[0] = instruction[1]
  instruction[1] = temp
end
instructions.map! { |instruction| instruction.unshift(instruction.pop) }
instructions.each { |instruction| circuit.plug_in_wire(instruction) }
circuit.run_circuit
puts circuit.signal_provided_to_wire('a')
