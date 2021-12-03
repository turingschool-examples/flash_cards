class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turns << current_card
    turn = Turn.new(guess, current_card)
  end

  def number_correct
    
  end

end
