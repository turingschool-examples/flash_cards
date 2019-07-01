class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @new_turn = @deck.cards[0]
    new_turn = Turn.new(guess, @deck.cards[0])
    @turn << new_turn
    @deck.cards.rotate
    current_card = @deck.cards[0]
    new_turn 
  end






end # class
