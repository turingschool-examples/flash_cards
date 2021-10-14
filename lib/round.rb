class Round
  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck  = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.rotate!
    new_turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    # counter = 0
    @turns.count do |turn|
      if turn.correct?
        category == turn.card.category
        # counter += 1
      # else

      end
    end
  end

end






