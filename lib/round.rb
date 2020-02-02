require './lib/deck'
require './lib/turn'

class Round
  attr_reader :deck,
              :turns,
              :number_correct,
              :correct_cards,
              :used_deck
  def initialize(deck)
    @deck = deck
    @used_cards = []
    @turns = []
    @number_correct = 0
    @correct_cards = []

  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, current_card)
    if guess == current_card.answer
      @number_correct += 1
      @correct_cards << current_card
    end
    @turns << current_turn
    @used_cards << @deck.cards.shift
    current_turn
  end

  def number_correct_by_category(category)
    correct_by_category = @correct_cards.find_all{|card|card.category == category}
    correct_by_category.length
  end

  def percent_correct
    (@number_correct.to_f / @turns.length.to_f) * 100
  end

  def percent_correct_by_category(category)

    total = @used_cards.find_all{|used_card| used_card.category ==  category}
    (number_correct_by_category(category) / total.length.to_f) * 100
  end
end
