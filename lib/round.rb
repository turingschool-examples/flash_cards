require_relative 'card'
require_relative 'deck'
require_relative 'turn'

class Round

  attr_reader :deck,
              :guess,
              :turns

  def initialize(deck)
    @deck = deck
    @guess = guess
    @turns = []

  end

# The take_turn method takes a string representing the guess.
# It should create a new Turn object with the appropriate guess and Card.
# It should store this new Turn, as well as return it from the take_turn method.
# Also, when the take_turn method is called, the Round should move on to the next card in the deck

  def take_turn(guess)
    next_turn = Turn.new(guess, current_card)
    @turns << next_turn
    @deck.cards.shift
    next_turn
  end

  def current_card
    @deck.cards.first
  end

  def number_correct
    number_correct = 0
    @turns.each do |turn|
      turn.correct?
        number_correct += 1
    end
    number_correct
  end

  def number_correct_by_category(category)
    number_correct_by_category = 0
    @turns.each do |turn|
      turn.card.category == category && turn.correct?
        number_correct_by_category += 1
      end
    number_correct_by_category
  end

  def percent_correct
    (number_correct.to_f / @turns.count * 100).round
  end

  def percent_correct_by_category(category)
    total_correct_by_category = 0
    @turns.each do |turn|
      turn.card.category == category
      total_correct_by_category += 1
    end
    (total_correct_by_category.to_f/@turns.count*100).round

end


card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = []
cards << card_1
cards << card_2
cards << card_3
deck = Deck.new(cards)
