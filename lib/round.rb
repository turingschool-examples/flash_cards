class Round

  attr_reader :deck, :turns
  attr_accessor :number_correct, :count, :total_cards, :cats

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @count = 1
    @total_cards = 0
    @cats = []
  end

  def current_card
    @deck.cards[0]
  end

end