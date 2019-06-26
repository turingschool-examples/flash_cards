class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = 0
  end

  def current_card
    @deck.cards[@current_card]
  end

  def take_turn(guess)
     record_turn = Turn.new(guess, current_card)
     @turns << record_turn
     deck.cards.shift
     record_turn
  end




end
