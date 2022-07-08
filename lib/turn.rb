# frozen_string_literal: true

class Turn
  attr_accessor :guess, :card, :feedback

  def initialize(string, card)
    @guess = string
    @card = card
    @feedback = ''
  end

  def correct?
    if @guess == @card.answer
      @feedback = 'Correct!'
      true
    else
      @feedback = 'Incorrect.'
      false
    end
  end
end
