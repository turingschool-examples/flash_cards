class Round
    attr_accessor :deck, :turns, :turn, :current_card
  
    def initialize(deck)
      @deck = deck
      @turns = []
      @current_card = @deck.cards[0]
    end
    def take_turn(guess)
        @turn = Turn.new(guess, @current_card)
    end
  end
  
  