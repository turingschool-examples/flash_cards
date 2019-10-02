# calls the card.rb file where I created a card class
require_relative 'card'

class Turn
  # takes care of both attr_reader and attr_writer
  attr_accessor :guess, :card, :correct, :feedback

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  # getter to return value of instance attribute
  def guess
    @guess
  end

  # also a getter
  def card
    @card
  end

  def guess_answer
    puts @card.question
    puts "Enter your answer here:"
    @guess = gets.chomp
  end

  def correct?
    if @guess == @card.answer
      true
    else
      false
    end
  end

  def feedback
    if correct?
      p "Correct!"
    else
      p "Incorrect, try again!"
    end
  end
end

card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card2 = Card.new("Who was the first woman to win a Noble Prize?", "Marie Curie", :Science)
card3 = Card.new("What style of art is characterized by its distinct use of dots to form images?", "Pointillism", :Art)

turn = Turn.new("", card1)
turn.guess_answer
turn.feedback
turn2 = Turn.new("", card2)
turn2.guess_answer
turn2.feedback
turn3 = Turn.new("", card3)
turn3.guess_answer
turn3.feedback

# initialize(string, card) - A turn is initialized with two arguments.
# The first is a string representing a guess to a card’s question.
# The second argument is a Card object representing the current flashcard being shown.
# guess - This method returns the guess
# card - This method returns the Card
# correct? - This method returns a boolean indicating if the guess matched the answer on the Card.
# feedback - This method either returns "Correct!" or "Incorrect."
