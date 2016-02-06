require 'digest'

class MD5Hash
  attr_reader :number

  def initialize(key)
    @key = key
    @number = '1'
  end

  def increment_number
    @number = (@number.to_i + 1).to_s
  end

  def start_with_5_zeros?
    hash = Digest::MD5.new
    hash.update(@key + @number)
    hash.hexdigest[0..4].chars.all? { |number| number == '0' }
  end
end

secret_key = 'iwrupvqb'
md5_hash = MD5Hash.new(secret_key)
md5_hash.increment_number until md5_hash.start_with_5_zeros?
puts md5_hash.number
