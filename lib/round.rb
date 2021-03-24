require_relative 'card'
require_relative 'deck'
require_relative 'turn'

class Round
  attr_reader :deck, :turns, :current_card, :card_index, :number_correct

  def initialize(deck_in_play)
    @turns = []
    @deck = deck_in_play
    @card_index = 0 # used as index to access cards in deck
    @current_card = @deck.cards[@card_index] # current card begins at the first card in the deck array
    @number_correct = 0


  end

  # This method does a lot of leg-work, specifically:
  # - instantiates new turn
  # - adds turn to turns array
  # - increments number_correct
  # - increments current card by one
  def take_turn(user_guess)
    new_turn = Turn.new(user_guess, @current_card) # instantiates new turn
    @turns << new_turn # adds turn to turns array

    # Cleaner way to do this?
    if new_turn.correct?
      @number_correct += 1
    end

    @card_index += 1 # increments current card by one

    return new_turn
  end


end

# The code below was used for testing purposes only
# card1 = Card.new('Given x = 13 and y = 2, what is the result of x to the power of y?',
# 169, :Math)
# card2 = Card.new('What is the capital of US state of Indiana?', 'Indianapolis', :Geography)
# card3 = Card.new('Fill in the blank: In the US, the ___ of Rights is a section of the Constitution that guarantees the rights and liberties for an individual.',
# "Bill", :Civics)
#
# cards = [card1, card2, card3]
# deck = Deck.new(cards)
#
# require 'pry'; binding.pry
