require './lib/card'

class Turn

  attr_reader :card, :guess
  
  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    process_turn_input(@guess) == process_turn_input(@card.answer)
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end

  def process_turn_input(str)
    str =~ /\d$/ ? (return str.to_i) : nil
    str.kind_of?(Numeric) ? (return str) : nil
    str.downcase
  end
end