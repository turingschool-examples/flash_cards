#~/round.rb
class Round
  attr_reader :deck, :turns, :count

  def initialize(deck)
    @deck = deck
    @turns = []
    @count = 1
  end

  def current_card
    @deck.cards[@count - 1]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @count += 1
    @turns.last
  end

end
