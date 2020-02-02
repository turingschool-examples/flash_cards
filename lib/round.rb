class Round
  attr_reader :deck, :turns
  attr_accessor :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[turns.count]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @current_card = deck.cards[turns.count]
    @turns[turns.count -1]
  end

  def number_correct
    @turns.count { |turn| turn.correct? }
  end

end
