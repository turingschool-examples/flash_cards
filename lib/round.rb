class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turn = Turn.new(guess, current_card)
    @turns << @turn
    @deck.cards.rotate!
    @turn
    #change the current card to the next card in the deck
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.correct? && turn.card.category == category
    end
  end

  def percent_correct
    number_correct.to_f / @turns.length * 100
  end

  def percent_correct_by_category(category)
    number_correct_by_category(:Geography).to_f / @turns.length * 100
  end
end
