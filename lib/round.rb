class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize (deck)
    @deck = deck
    @turns = []
    @current_card = [0]
    @number_correct = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @current_card += [1]
    @turns.correct? == true
    end
  end
end
