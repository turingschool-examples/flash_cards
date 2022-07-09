class Round
  attr_reader :deck, :turns, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
  end

  def take_turn(guess)
    turn_taken = Turn.new(guess, @current_card)
    @turns << turn_taken
    @current_card = @deck.cards[@turns.length]
    return turn_taken
  end

  def number_correct
    number_correct = 0
    @turns.each do |turn|
      if turn.correct? == true
        number_correct += 1
      end
    end
    return number_correct
  end

end
