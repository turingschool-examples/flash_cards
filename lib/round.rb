class Round
  attr_reader :turns, :deck, :cards, :card_counter
  def initialize(deck)
    @deck = deck
    @turns = []
    @card_counter = -1
  end


  def current_card
    self.deck.cards[@card_counter]
  end


  def take_turn(guess)
    @card_counter += 1
    @turns.push Turn.new(guess, current_card)
    return @turns.last
  end


end
