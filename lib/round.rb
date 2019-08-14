require './lib/deck'

class Round
  attr_reader :deck, :current_card, :turns

  def initialize(deck)
    @deck = deck
    @current_card = deck.cards[0]
    @turns = Array.new
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    @current_card = deck.cards[0]
    turn
  end

  def number_correct
    correct_cards = Array.new
    @turns.each do |turn|
      if turn.correct?
        correct_cards << turn
      else
      end
    end
      correct_cards.count
  end

  def number_correct_by_category(category)
    @turns.find_all{ |turn| turn.correct? && turn.card.category == category}.count
  end

  def percent_correct
    (number_correct / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) / @turns.find_all{ |turn| turn.card.category == category}.count.to_f) * 100
  end
end
