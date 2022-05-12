require './card.rb'
class Turn
  attr_reader :guess, :card, :feedback
  def initialize (user_guess, card)
    @guess = guess
    @card = card
    @feedback = feedback
  end

  def correct?
    @guess = card.answer
  end

  def feedback
    @guess = card.answer ?
  end
end
