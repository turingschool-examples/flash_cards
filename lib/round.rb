class Round
  attr_reader :deck, :turns

  @@rounds = Set.new

  def initialize(deck)
    @deck = deck
    @turn_count = 0
    @turns = [] ||
    @@rounds << self
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turn_count += 1
    @turns.push(Turn.new(guess, current_card))
    check_guess
  end

  def check_guess
    @turns.last.correct?
    card_complete
  end

  def card_complete
    @deck.cards.rotate
  end
end
