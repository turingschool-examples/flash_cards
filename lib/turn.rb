require './lib/card'

class Turn
  def initialize(string, card)
    @guess = process_turn_input(string)
    @card = card
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct?
    @guess == process_turn_input(@card.answer)
  end

  def feedback
    correct? ? "Correct!" : "Incorrect"
  end

  def process_turn_input(str)
    str =~ /\d$/ ? (return str.to_i) : nil
    str.kind_of?(Numeric) ? (return str) : nil
    str.downcase
  end
end