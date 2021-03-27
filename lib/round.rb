require './lib/turn'

class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    # deck.cards.first
    deck.cards[@turns.count]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    turn
  end

  def identify_correct
    @turns.find_all do |turn|
      turn.correct?
    end
  end

  def number_correct
    identify_correct.count
  end

  def number_correct_by_category(category)
    turns.find_all do |turn|
      turn.correct? == true && turn.card.category == category
    end.count
  end

  def percent_correct
    (number_correct.to_f/turns.count) * 100
  end

  def percent_correct_by_category(category)
    total_correct = number_correct_by_category(category)
    category_total = deck.cards_in_category(category).count
    (total_correct.to_f/category_total) * 100
  end


end
