class Round
  attr_reader :deck, :turns
#Initializes the round object and passes an arguement deck.
  def initialize(deck)
    @deck = deck
    @turns = []


  end

  def current_card

   deck.cards.first

  end

  def take_turn

  end
end
