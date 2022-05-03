# turn.rb
require_relative 'card'
class Turn
  attr_accessor :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == card.answer ? true : false
  end

  def feedback?
  end
end

require 'pry'; binding.pry
