class Round
  attr_accessor   :deck,
                  :turns,
                  :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = current_card
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards = @deck.cards.rotate
    turn
  end

  def correct?
    @turns == Turn.new(guess, current_card)
  end

  def number_correct
    @turns.length
  end

end
