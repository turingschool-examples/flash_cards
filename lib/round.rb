class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = [0]
    end

    def current_card
      @deck.cards.first
    end

    def number_correct
      @number_correct.map {|n| n+1 }
    end

    def take_turn(guess)
      @turns << Turn.new(guess, current_card)
      @turns[0].correct?
        if true
          number_correct && current_card
        end
    end 
end
