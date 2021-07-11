require 'rspec'
require './lib/card'

class Turn
  attr_reader :guess, :card

  # initialize a turn with a guess and a Card object
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  # determine if the user's guess matches the expected guess
  # compare the user's guess to the card's answer - downcase both to account
  # for any capitalization at the beginning
  # return true if guess is correct
  # return false if guess is incorrect
  def correct?
    if @guess.downcase == @card.answer.downcase
      true
    else
      false
    end
  end

  # provide feedback to the user if they have guessed correctly/incorrectly
  # call the 'correct?' - if the user's guess was true, return 'Correct!' feedback
  # if user's guess was false, return "Incorrect" feedback
  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect"
    end
  end
 end
