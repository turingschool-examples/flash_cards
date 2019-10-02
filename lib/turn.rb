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

card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card2 = Card.new("Who was the first woman to win a Noble Prize?", "Marie Curie", :Science)
card3 = Card.new("What style of art is characterized by its distinct use of dots to form images?", "Pointillism", :Art)

turn = Turn.new("Juneau", card1)

turn.feedback
turn2 = Turn.new("Guess2", card2)

turn2.feedback
turn3 = Turn.new("Guess3", card3)

turn3.feedback
