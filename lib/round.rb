class Round

  attr_reader :deck, :turns

  def initialize (deck, turns = [])
    @deck = deck
    @turns = turns
  end

  def current_card
    deck.cards[@turns.length]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    count = 0
    turns.each do |turn|
      if turn.correct?
      count += 1
    end
  end
    count
  end
end
