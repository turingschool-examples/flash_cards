require_relative 'card'
require_relative 'deck'
require_relative 'turn'

class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck_in_play)
    @turns = []
    @deck = deck_in_play
    @current_card = @deck.cards[0] # current card begins at the first card in the deck array

  end

  def take_turn(user_guess)
    # Will have to work with the Turn class here
    # specifically the guess method.
  end

end

# The code below was used for testing purposes only
card1 = Card.new('Given x = 13 and y = 2, what is the result of x to the power of y?',
169, :Math)
card2 = Card.new('What is the capital of US state of Indiana?', 'Indianapolis', :Geography)
card3 = Card.new('Fill in the blank: In the US, the ___ of Rights is a section of the Constitution that guarantees the rights and liberties for an individual.',
"Bill", :Civics)

cards = [card1, card2, card3]
deck = Deck.new(cards)

require 'pry'; binding.pry
