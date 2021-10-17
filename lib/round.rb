class Round
  attr_accessor :turns, :deck
  def initialize (deck)
    @turns = []
    @deck = deck
    @correct_categories = []
    end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    if turn.correct?
      @correct_categories << turn.card.category
    end
    @deck.cards.rotate!(1)
    turn
  end
end
