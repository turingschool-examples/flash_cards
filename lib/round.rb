class Round
  attr_reader :deck, :turns
    def initialize(deck)
      @deck = deck
      @turns = []
    end

    def current_card
      p @deck.cards.first
    end

end
