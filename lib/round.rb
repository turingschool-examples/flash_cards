class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    turn
    deck.cards.shift
  end

  def number_correct
    i = 0
    if @turns.first.correct? == true
      i += 1
    else i += 0
      end
    i
  end

end
