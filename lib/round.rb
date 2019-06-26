
class Round
  attr_reader :deck, :turns, :current_card

  def initialize (deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
    #@guess = ""
  end

  def take_turn (string)
    #@guess = string
    turn = Turn.new(string, @deck.cards[0])
    @turns << turn
    @deck.cards.unshift
    return turn
  end

end

#deck.cards is an array
@deck.cards.each do |card|

end
