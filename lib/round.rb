
class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = [ ]
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    x = Turn.new(guess, deck.cards.shift)
    @turns << x
    turns.last
  end

  def number_correct
    turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    turns.count do |turn|
      turn.correct? && category == turn.card.category
    end
  end

    def percent_correct
      (number_correct / deck.count.to_f ) * 100
    end
  end
