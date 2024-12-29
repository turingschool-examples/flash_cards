require 'pry'
require_relative 'card' # Use require_relative to ensure the correct path

class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback #will return "Correct!" if the guess is correct and "Incorrect." if the guess is incorrect
    correct? ? "Correct!" : "Incorrect."
  end
end