class Round
  attr_reader :deck, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    turns[-0]
  end

  def number_correct
    @turns.map do |turn|
      if turn.correct?
        @number_correct += 1
      end
    end
  end
end
