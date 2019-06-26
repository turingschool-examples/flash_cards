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
    this_turn
  end

  def number_correct
    @turns.select {|turn| turn.correct?}.count
  end

  def number_correct_by_category(category)
    @turns.select {|turn| turn.card.category == category && turn.correct?}.count
  end

  def percent_correct

  end

  def percent_correct_by_category(category)

  end
end
# card1 = Card.new("5 + 5 = ", "10", :Math)
# card2 = Card.new("7 * 6 = ", "42", :Math)
# card3 = Card.new("H2O is", "water", :Science)
# cards = [card1, card2, card3]
# deck = Deck.new(cards)
# round = Round.new(deck)
# turn_1 = round.take_turn("10")
# binding.pry
