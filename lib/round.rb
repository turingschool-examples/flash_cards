class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(answer)
    new_turn = Turn.new(answer, @deck.cards[@turns.count])
    @turns << new_turn
    return new_turn
  end

  def number_correct
    correct_count = 0
    @turns.each do |turn|
      if turn.feedback == "Correct!"
        correct_count += 1
      end
    end
    correct_count
  end

end
