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
    @turns.map do |turn|
      turn.correct?
    end
  end

  def number_correct
    identify_correct.count
  end

  def number_correct_by_category(category)
    cat = turns.find_all do |turn|
      turn.correct? == true && turn.card.category == category
    end
    cat.length
  end





end
