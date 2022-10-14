require './lib/card'

class Turn
  def initialize(string, card)
    @guess = process_guess(string)
    @card = card
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct?
    guess == card.answer
  end

  def feedback
    correct? ? "Correct!" : "Incorrect"
  end

  def process_guess(str)
    str =~ /\d$/ ? (return str.to_i) : nil
    str.is_a?(Numeric) ? (return str) : nil
    str.downcase
  end
end