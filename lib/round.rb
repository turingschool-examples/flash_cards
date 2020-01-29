class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @flip = 0
    # @current_card = @deck.cards[@flip]
    @number_correct = 0
  end

  def current_card
    @deck.cards[@flip]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @number_correct += 1 if new_turn.feedback == "Correct"
    @turns << new_turn
    @flip += 1
    new_turn
  end

  def number_correct_by_category(category)
    matches = 0

    @turns.each do |turn|
      if turn.card.category == category && turn.feedback == "Correct"
        matches += 1
      end
    end
    matches
  end

  def percent_correct
    (@number_correct.to_f / @turns.length) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / @turns.length) * 100
  end
end