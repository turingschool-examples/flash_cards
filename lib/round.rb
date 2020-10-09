class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @turns.last
  end

  def number_correct
    @turns.count do |turn|
      turn.correct == true
    end
  end

  def number_correct_by_category(category)
    correct_by_category = 0
    @turns.select do |turn|
      if turn.card.category == category && turn.correct? == true
        correct_by_category += 1
      end
    end
    correct_by_category
  end
# helper method for percent correct
  def total_guesses
    @turns.count
  end

  def percent_correct
    (number_correct.to_f/total_guesses * 100)
  end
end
