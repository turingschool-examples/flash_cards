class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck

    def turns
      turns = []
      turns << @turn.new_turn
    end


    def current_card
      deck.cards[0]
    end


    def take_turn
      @turn.new_turn
    end


    def number_correct
    end


    def number_correct_by_category
    end


    def percent_correct
    end


    def percent_correct_by_category
    end

  end

end
