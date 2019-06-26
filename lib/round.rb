require 'pry'
require './lib/card'
require './lib/deck'
require './lib/turn'
class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @current_card_index = 0
    @turns = []
  end

  def current_card
    deck.cards[@current_card_index]
  end

  def current_card_index
    @current_card_index
  end

  def next_card
    unless @current_card_index == (deck.count - 1)
      @current_card_index += 1
    end
  end

  def take_turn(guess)
    this_turn = Turn.new(guess, current_card)
    turns << this_turn
    next_card
    return this_turn
  end

  def number_correct
    
  end

  def number_correct_by_category(category)

  end

  def percent_correct

  end

  def percent_correct_by_category(category)

  end
end
card1 = Card.new("5 + 5 = ", "10", :Math)
card2 = Card.new("7 * 6 = ", "42", :Math)
card3 = Card.new("H2O is", "water", :Science)
cards = [card1, card2, card3]
deck = Deck.new(cards)
round = Round.new(deck)
binding.pry
