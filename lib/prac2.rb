class Turn
  attr_reader :guess
  def initialize(guess)
    @guess = guess
  end

  def guess guess
    puts guess
  end
end

turn1 = Turn.new(" ")
puts "Enter a guess:"
turn1.guess(gets.chomp)
