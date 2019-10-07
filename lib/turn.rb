# calls the card.rb file where I created a card class
require_relative 'card'

class Turn
  # takes care of both attr_reader and attr_writer
  attr_accessor :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  # def guess_answer
  #   puts @card.question
  #   puts "Enter your answer here:"
  #   @guess = gets.chomp
  # end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if correct?
       "Correct!"
    else
       "Incorrect, try again!"
    end
  end
end
