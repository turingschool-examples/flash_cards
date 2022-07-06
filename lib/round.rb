# require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_accessor :turns, :deck, :current_card, :number_correct, :correct_turns

  def initialize(deck)
    @deck = deck
    @current_card = deck.cards[0]
    @turns = []
    @correct_turns= []
  end

  def take_turn(string_as_guess)
    new_turn = Turn.new(string_as_guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    turns.each do |turn|
      if turn.correct?
        correct_turns << turn
      end
    end
    correct_turns.size
  end

def number_correct_by_category(category)
  turns.each do |turn|
    if turn.correct? && turn.card.category == category
      correct_turns << turn
    end
  end
  correct_turns.size
end

def percent_correct
end
  # def shuffle
  #   deck.rotate
  # end

end

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
round = Round.new(deck)
p round.turns
round.take_turn("Juneau")
p round.turns
p round.number_correct
